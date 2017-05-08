module Api
  module V1
    class ProfileController < Api::BaseController
      before_action :authenticate_user

      # TODO:
      def artists
      end

      # TODO:
      def releases
      end

      def add_artists
        artists = Spotify::Artist.find_all(artists_ids)
        artist_repository = Repositories::ArtistRepository.new

        artists.each { |artist| artist_repository.create_or_update(artist.attributes) }

        head :created
      end

      private

      def attributes
        [:artists_ids]
      end

      def artists_ids
        resource_params[:artists_ids].split(",").map(&:strip)
      end
    end
  end
end
