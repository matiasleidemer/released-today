module Repositories
  class AlbumRepository
    attr_reader :model

    def initialize(model = Album)
      @model = model
    end

    def create_or_update(data)
      record = model.find_or_initialize_by(spotify_id: data[:spotify_id]) do |instance|
        instance.artist_id        = data[:artist_id]
        instance.name             = data[:name]
        instance.image_url        = data[:image_url]
        instance.number_of_tracks = data[:number_of_tracks]
        instance.released_at      = data[:released_at]
      end

      record.save
      record
    end
  end
end
