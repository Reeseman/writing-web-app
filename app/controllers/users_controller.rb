class UsersController < ProtectedBySessionsController
  def user_data
    render json: { token: params.to_s }, status: 200
    # render json: User.where(email: params[:email]).first, status: 200
  end
end
