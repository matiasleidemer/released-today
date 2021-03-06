# frozen_string_literal: true

RSpec.shared_examples 'Secure API' do |verb, endpoint|
  it 'returns unauthorized if user token is invalid' do
    send(verb, endpoint, headers: { 'Authorization' => 'Bearer nope' })

    expect(response.status).to eq(401)
    expect(response.body).to eq('Bad credentials')
  end
end
