# typed: false
class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.integer :user_id_1, index: true # "from"
      t.integer :user_id_2, index: true # "to"
      t.boolean :accepted, default: false
      t.timestamps
    end
    add_foreign_key :connections, :users, column: :user_id_1, index: true, null: false, on_delete: :cascade
    add_foreign_key :connections, :users, column: :user_id_2, index: true, null: false, on_delete: :cascade
  end
end
