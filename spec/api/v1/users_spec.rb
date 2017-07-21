require 'rails_helper'
require 'released/jwt'

RSpec.describe "Users API", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:jwt) { Released::Jwt.encode({ claims: { roles: ['admin'] } }) }
  let(:headers) { { "Authorization" => "Bearer #{jwt}" } }

  describe "GET show" do
    it_behaves_like "Secure API", :get, "/api/v1/users/1"

    it "returns the user's data" do
      get "/api/v1/users/#{user.id}", headers: headers

      result = {
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
          provider: user.provider,
          uid: user.uid,
          metadata: user.metadata,
          token: user.token
        }
      }

      expect(response.status).to eq(200)
      expect(response.body).to eq(result.to_json)
    end
  end

  describe "GET find" do
    let(:user) { FactoryGirl.create(:user) }

    it_behaves_like "Secure API", :get, "/api/v1/users/find"

    it 'returns the user with the provided email' do
      get "/api/v1/users/find", params: { email: user.email }, headers: headers
      payload = ActiveModelSerializers::SerializableResource.new(user, {})

      expect(response.body).to eql(payload.to_json)
    end

    it "returns nil when the user doesn't exist" do
      get "/api/v1/users/find", params: { email: 'foo@bar.com' }, headers: headers

      expect(response.body).to eql(nil.to_json)
    end
  end

  describe "POST create" do
    context "with valid parameters" do
      let(:params) do
        FactoryGirl
          .build(:user_params)
          .merge(metadata: { foo: :bar })
      end

      it_behaves_like "Secure API", :post, "/api/v1/users"

      it "creates and returns a new user" do
        post "/api/v1/users", params: params, headers: headers
        user = User.last

        result = {
          user: {
            id: user.id,
            name: user.name,
            email: user.email,
            provider: user.provider,
            uid: user.uid,
            metadata: { foo: :bar }.to_json,
            token: user.token
          }
        }

        expect(response.status).to eql(200)
        expect(response.body).to eql(result.to_json)
      end
    end

    context "with invalid parameters" do
      let(:params) do
        {
          name: 'John Snow',
          email: '',
          provider: 'spotify',
          uid: ''
        }
      end

      it "returns the resource errors" do
        post "/api/v1/users", params: params, headers: headers

        result = {
          errors: {
            email: ["can't be blank"],
            uid: ["can't be blank"]
          }
        }

        expect(response.status).to eql(422)
        expect(response.body).to eql(result.to_json)
      end
    end
  end
end
