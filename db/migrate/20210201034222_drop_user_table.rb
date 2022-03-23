# typed: ignore
class DropUserTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :users, force: :cascade, force: :cascade
  end
end
