# typed: strict
class Connection < ActiveRecord::Base
  extend T::Sig
  validates :user_id_1, :user_id_2, presence: true
  before_save :check_exists

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

  sig {void}  
  def check_exists
    option1 = Connection.where(user_id_1: self.user_id_1, user_id_2: self.user_id_2)
    option2 = Connection.where(user_id_1: self.user_id_2, user_id_2: self.user_id_1)
    if option1.or(option2).count != 0
      raise 'connection already exists'
      # errors.add(:user_id_1, :user_id_2, message: "connection already exists")
    end
  end
end
