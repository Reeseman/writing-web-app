class ConnectionsController < ProtectedBySessionsController
  def make_connection
    from_uid = params['fromUid'].to_i
    email = params['email']
    user = User.where(email: email).first
    if user.nil?
      render json: {error: 'Requested user does not exist'}, status: 400
    else
      to_uid = user.id
      if from_uid == to_uid
        render json: {error: 'Cannot create a connection to yourself'}, status: 400
      elsif Connection.where(user_id_1: from_uid, user_id_2: to_uid, accepted: true).count != 0 or Connection.where(user_id_2: from_uid, user_id_1: to_uid, accepted: true).count != 0
        render json: {error: 'You are already connected to that user'}, status: 400
      elsif Connection.where(user_id_1: from_uid, user_id_2: to_uid).count != 0
        render json: {error: 'You have already made a request to that user'}, status: 400
      elsif Connection.where(user_id_2: from_uid, user_id_1: to_uid).count != 0
        render json: {error: 'That user has already sent you a connection request'}, status: 400
      else
        connection = Connection.create(user_id_1: from_uid, user_id_2: to_uid)
        render json: connection, status: 200
      end
    end
  end

  def delete_connection
    from_uid = params['fromUid'].to_i
    email = params['email']
    user = User.where(email: email).first
    if user.nil?
      render json: {error: 'Requested user does not exist'}, status: 400
    else
      to_uid = user.id
      connection = Connection.where(user_id_1: from_uid, user_id_2: to_uid).or(Connection.where(user_id_2: from_uid, user_id_2: to_uid)).first
      if connection.nil?
        render json: {error: 'That connection doesn\'t exist'}, status: 400
      else
        connection.delete
        render json: {}, status: 200
      end
    end
  end

  def show
    uid = JSON.parse(params[:token])['user']['id']
    connections = Connection.where(user_id_1: uid).or(Connection.where(user_id_2: uid)).to_a
    render json: connections, status: 200
  end
end
