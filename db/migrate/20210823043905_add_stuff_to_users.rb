# typed: true
class AddStuffToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table(:users) do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      # t.remove :name, :string SCARY LINE HERE
    end
  end
end
