class CreateWrits < ActiveRecord::Migration[6.1]
  def change
    create_table :writs do |t|
      t.string :title
      t.boolean :finished
      t.boolean :started
      t.integer :max_entry_word_count
      t.integer :min_entry_word_count
      t.integer :max_total_word_count
      t.integer :min_total_word_count

      t.timestamps
    end
  end
end
