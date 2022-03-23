# typed: strict
class WritUser < ApplicationRecord
  belongs_to :user
  belongs_to :writ
end
