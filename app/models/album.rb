class Album < ApplicationRecord
  belongs_to :artist

  has_many :notifications, dependent: :destroy

  validates :artist_id, :spotify_id, :name, :number_of_tracks, presence: true

  def followers
    artist.users
  end

  def released_today?
    released_at.today?
  end
end
