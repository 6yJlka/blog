class AddFriendsToUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :friend, null: false, foreign_key: { to_table: :users }
    end
  end
end
