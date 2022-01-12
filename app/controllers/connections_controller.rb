class ConnectionsController < ProtectedBySessionsController
  def make_connection
    from_uid = params['fromUid'].to_i
    email = params['email']
    user = User.where(email: email).first
    bad_request = bad_request(user, from_uid)
    return render json: { error: bad_request }, status: 400 unless bad_request.nil?

    connection = Connection.create(user_id_1: from_uid, user_id_2: to_uid)
    render json: connection, status: 200
  end

  def delete_connection
    from_uid = params['fromUid'].to_i
    email = params['email']
    user = User.where(email: email).first
    return render json: { error: 'Requested user does not exist' }, status: 400 if user.nil?

    to_uid = user.id
    connection = get_existing_connection(from_uid, to_uid)
    return render json: { error: 'That connection doesn\'t exist' }, status: 400 if connection.nil?

    connection.delete
    render status: 200
  end

  def show
    uid = JSON.parse(params[:token])['user']['id']
    connections = Connection.where(user_id_1: uid).or(Connection.where(user_id_2: uid)).to_a
    render json: connections, status: 200
  end

  private

  def get_existing_connection(from_uid, to_uid)
    option_2 = Connection.where(user_id_2: from_uid, user_id_1: to_uid)
    Connection.where(user_id_1: from_uid, user_id_2: to_uid).or(option_2).first
  end

  def already_connected?(from_uid, to_uid)
    return true if Connection.where(user_id_1: from_uid, user_id_2: to_uid, accepted: true).count != 0
    return true if Connection.where(user_id_2: from_uid, user_id_1: to_uid, accepted: true).count != 0

    false
  end

  def bad_request(user, from_uid)
    return 'Requested user does not exist' if user.nil?

    to_uid = user.id
    return 'Cannot create a connection to yourself' if from_uid == to_uid
    return 'You are already connected to that user' if already_connected?(from_uid, to_uid)
    return 'You have already made a request to that user' if connection_request_exists?(from_uid, to_uid)
    return 'That user has already sent you a connection request' if connection_request_exists?(to_uid, from_uid)

    nil
  end

  def connection_request_exists?(from_uid, to_uid)
    Connection.where(user_id_1: from_uid, user_id_2: to_uid).count != 0
  end
end