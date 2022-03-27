# typed: false

class Api::V1::WritsController < ProtectedBySessionsController
  def create
    writ_users = params['collaborators']

    bad_request = bad_request_create(writ_users)
    return render json: { error: bad_request }, status: 400 if not bad_request.nil?

    writ_params = {
      title: '',
      started: true,
      max_entry_word_count: params['maxEntryWordCount'],
      min_entry_word_count: params['minEntryWordCount'],
      max_total_word_count: params['maxTotalWordCount'],
      min_total_word_count: params['minTotalWordCount'],
    }
    writ_dto = Writ.create(writ_params).as_json
    success = WritUser.create_writ_users(uid, writ_users, writ_dto.id)

    return render json: { error: 'something went wrong making users'}, status: 500 if not success

    head :ok
  end

  private 

  sig {params(writ_users: T::Array[Integer]).returns(T.nilable(String))}
  def bad_request_create(writ_users)
    return 'select at least one collaborator' if not is_populated_array(writ_users)
    uid = JSON.parse(params[:token])['user']['id']
    return 'one or more connections are invalid' if not Connection.are_connections_valid(uid, writ_users)
    nil
  end

  sig {params(arr: T::Array[Integer]).returns(T::Boolean)}
  def is_populated_array(arr) 
    return arr.kind_of?(Array) && !arr.empty?
  end
end
