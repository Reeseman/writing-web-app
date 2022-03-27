# typed: strict
class Connection < ActiveRecord::Base
  extend T::Sig 

  sig {params(uid: String, uids: T::Array[String]).returns(T.nilable(T::Boolean))}
  def are_connections_valid(uid, uids)
    uids.each do |other_uid|
      option_1 = Connection.where(user_id_1: uid, user_id_2: other_uid, accepted: true)
      option_2 = Connection.where(user_id_1: uid, user_id_2: other_uid, accepted: true)

      if option_1.or(option_2).count == 0
        return false
      end
    end
    true
  end
end
