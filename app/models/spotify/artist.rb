# frozen_string_literal: true

module Spotify
  class Artist
    attr_reader :payload

    delegate :hash, to: :spotify_id

    def initialize(payload)
      @payload = payload.with_indifferent_access
    end

    def self.build_from_collection(artists)
      artists.map { |artist| build(artist) }
    end

    def self.build(artist)
      new(JSON.parse(artist.to_json).with_indifferent_access)
    end

    def self.find(artist_id, client = RSpotify::Artist)
      payload = JSON.parse(client.find(artist_id).to_json).with_indifferent_access
      new(payload)
    end

    def self.find_all(artists_ids, client = RSpotify::Artist)
      artists = JSON.parse(client.find(artists_ids).to_json)
      artists.map { |payload| new(payload.with_indifferent_access) }
    end

    def eql?(other)
      spotify_id == other.spotify_id
    end

    def latest_releases
      Spotify::LatestReleasesFinder.call(artist: self)
    end

    def name
      payload[:name]
    end

    def spotify_id
      payload[:id]
    end

    def metadata
      payload
    end

    def attributes
      {
        name: name,
        spotify_id: spotify_id,
        metadata: payload
      }
    end
  end
end
