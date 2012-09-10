class AddVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified_at, :datetime, :default => nil
  end
end
