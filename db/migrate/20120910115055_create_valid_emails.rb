class CreateValidEmails < ActiveRecord::Migration
  def change
    create_table :valid_emails do |t|
      t.string :email
      t.datetime :checked_in_at, :default => nil
      t.string :permissions, :default => 'volunteer'

      t.timestamps
    end
  end
end
