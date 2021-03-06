# frozen_string_literal: true

class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def update
    current_user.update(permitted_params)
    redirect_to preferences_path, flash: { success: 'Preferences updated successfully!' }
  end

  private

  def permitted_params
    params.require(:user).permit(:name, :email_frequency)
  end
end
