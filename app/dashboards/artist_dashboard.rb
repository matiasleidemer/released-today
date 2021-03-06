# frozen_string_literal: true

require 'administrate/base_dashboard'

class ArtistDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    albums: Field::HasMany,
    spotify_id: Field::String,
    disabled_at: Field::DateTime,
    metadata: Field::String.with_options(searchable: false)
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    albums
    disabled_at
    spotify_id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    albums
    disabled_at
    spotify_id
    metadata
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    albums
    name
    disabled_at
    spotify_id
    metadata
  ].freeze

  # Overwrite this method to customize how artists are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(artist)
    artist.name
  end
end
