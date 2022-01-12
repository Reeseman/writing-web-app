class UsersController < ProtectedBySessionsController
  def user_data
    token = JSON.parse(params[:token])
    render json: User.find(token['user']['id']), status: 200
  end
end
