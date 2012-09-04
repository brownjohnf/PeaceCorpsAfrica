class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.integer :page_id
      t.boolean :active, :default => true
      t.integer :num_volunteers, :default => 0
      t.integer :num_total_volunteers, :default => 0
      t.date :pc_start_date
      t.string :site_url
      t.string :donate_url
      t.string :contact_email

      t.timestamps
    end

    add_index :countries, :name, :unique => true
    add_index :countries, :code, :unique => true
  end
end
