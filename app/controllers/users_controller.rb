# typed: false
class UsersController < ProtectedBySessionsController
  def user_data
    render json: User.find(params[:uid]), status: 200
  end
end
