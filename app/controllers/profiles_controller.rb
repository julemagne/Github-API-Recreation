class ProfilesController < ApplicationController
  def search

  end

  def profile
    @name = params[:name]
  end
end
