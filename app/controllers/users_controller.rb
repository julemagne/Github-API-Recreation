require 'byebug'

class UsersController < ApplicationController
  def search
  end

  def results
    @user = params[:username]
    person = User.new(@user)
    get_info = person.pull_repo_info
    render json: get_info
  end
end
