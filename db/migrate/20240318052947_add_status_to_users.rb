class AddStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :boolean, default: false
    add_column :users, :last_seen_at, :datetime, default: Time.now
  end
end
