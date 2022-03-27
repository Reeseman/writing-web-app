# typed: strict
class WritUser < ApplicationRecord
  extend T::Sig 

  belongs_to :user
  belongs_to :writ

  sig {params(uid: String, uids: T::Array[String], writ_id: Integer).returns(T::Boolean)}
  def create_writ_users(uid, uids, writ_id)

    ordinal = 1
    users = []
    users << WritUser.create!(user_id: uid, writ_id: writ_id, ordinal: ordinal)

    uids.each do |other_uid|
      ordinal += 1
      users << WritUser.create!(user_id: other_uid, writ_id: writ_id, ordinal: ordinal)
    end

    users.length == uids.length + 1
  end
end
