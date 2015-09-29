require 'byebug'

class UsersController < ApplicationController
  def search
  end

  def results
    @user = params[:username]
    response = User.get_repos(@user)
    person = User.new(@user, response)
    get_info = person.pull_repo_info
    render json: get_info
  end
end
