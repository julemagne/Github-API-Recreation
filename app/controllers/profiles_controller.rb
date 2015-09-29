class ProfilesController < ApplicationController
  def search
  end

  def result
    @name_result = Name.new(params[:name])

  end
end
