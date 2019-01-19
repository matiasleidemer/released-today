module Spotify
  class ReleasesSyncer
    class << self
      def call(artists: nil, send_notification: true)
        album_repository = Repositories::AlbumRepository.new

        artists ||= ::Artist.stale

        artists.find_each do |artist|
          spotify_artist = Spotify::Artist.new(artist.metadata)

          spotify_artist.latest_releases.each do |release|
            next if album_repository.exists?(spotify_id: release.spotify_id)

            attributes = release.attributes.merge(artist_id: artist.id)
            album = album_repository.create(attributes)

            next unless send_notification
            next unless album.released_today?

            album.followers.each do |follower|
              Notification.create(album: album, user: follower)
            end
          end

          artist.touch
        end
      end
    end
  end
end
