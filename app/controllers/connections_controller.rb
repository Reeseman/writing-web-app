class ConnectionsController < ProtectedBySessionsController
  def make_connection
    from_uid = params['fromUid']
    email = params['email']
    user = User.where(email: email).first
    if user.nil?
      render json: {error: 'Requested user does not exist'}, status: 400
    else
      to_uid = user.id
      connection = Connection.create(user_id_1: from_uid, user_id_2: to_uid)
      render json: connection, status: 200
    end
  end

  def show
    uid = JSON.parse(params[:token])['user']['id']
    connections = Connection.where(user_id_1: uid).or(Connection.where(user_id_2: uid)).to_a
    render json: connections, status: 200
  end
end
