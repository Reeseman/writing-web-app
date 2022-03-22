class CreateWritSnippets < ActiveRecord::Migration[6.1]
  def change
    create_table :writ_snippets do |t|
      t.integer :ordinal
      t.references :user, null: false, foreign_key: true
      t.references :writ, null: false, foreign_key: true
      t.references :writ_user, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
