# typed: strict
require "test_helper"

class WritSnippetTest < ActiveSupport::TestCase
  test "can't make the same connection twice" do
    Connection.new(user_id_1: User.first.id, user_id_2: User.second.id).save!
    Connection.new(user_id_1: User.first.id, user_id_2: User.second.id).save!
  end
end
