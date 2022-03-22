class WritSnippet < ApplicationRecord
  belongs_to :user
  belongs_to :writ
  belongs_to :writ_user
end
