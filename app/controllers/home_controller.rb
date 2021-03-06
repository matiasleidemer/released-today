# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    authenticate_spotify

    if current_user.present?
      redirect_to dashboard_url
    else
      render layout: 'landing_page'
    end
  end

  private

  def authenticate_spotify
    AuthenticateSpotify.call(
      client_id: Rails.application.secrets.spotify_client_id,
      client_secret: Rails.application.secrets.spotify_client_secret,
      env: Rails.env
    )
  end
end
