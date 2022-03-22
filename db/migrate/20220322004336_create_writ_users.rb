class CreateWritUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :writ_users do |t|
      t.integer :ordinal
      t.references :user, null: false, foreign_key: true
      t.references :writ, null: false, foreign_key: true

      t.timestamps
    end
  end
end
