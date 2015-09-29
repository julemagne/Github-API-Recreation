class GProfileController < ApplicationController
  def search
  end

  def results
    @user = params[:username]
  end
end
