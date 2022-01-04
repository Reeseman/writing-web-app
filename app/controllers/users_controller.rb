
class UsersController < ProtectedBySessionsController
  def user_data
    token = JSON.parse(params[:token]);
    #     logger.info(token.to_json)
    
    render json: User.find(token['user']['id']), status: 200
  end
end
