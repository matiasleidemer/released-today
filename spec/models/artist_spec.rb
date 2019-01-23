require 'rails_helper'

RSpec.describe Artist do
  describe '.create_or_update_from_spotify' do
    subject { described_class.create_or_update_from_spotify(payload) }

    let(:payload) do
      {
        spotify_id: '1q2w3e',
        name: 'Descendents',
        metadata: { spotify_id: '1q2w3e', name: 'Descendents' }.to_json
      }
    end

    it "creates a new user using spotify's payload" do
      artist = subject

      expect(artist.spotify_id).to eql('1q2w3e')
      expect(artist.name).to eql('Descendents')
      expect(artist.metadata).to eql(payload[:metadata])
    end
  end

  describe '#image_url' do
    let(:artist) { Artist.new(metadata: { 'images' => [{ 'url' => 'image_path' }] }) }

    it "returns the artist's image url" do
      expect(artist.image_url).to eql('image_path')
    end

    context 'images metadata is empty' do
      let(:artist) { Artist.new(metadata: { 'images' => [] }) }

      it 'returns nil' do
        expect(artist.image_url).to be_nil
      end
    end
  end
end
