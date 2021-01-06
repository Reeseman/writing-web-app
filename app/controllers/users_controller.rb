class UsersController < ApplicationController
  def first_user_email
    render json: User.first.email
  end
end
