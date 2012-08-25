class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :name
      t.date :start_date
      t.integer :page_id
      t.integer :num_volunteers
      t.string :site_url
      t.string :donate_url
      t.string :contact_email
      t.string :abbreviation

      t.timestamps
    end
    
    add_index :initiatives, :abbreviation, :unique => true
    add_index :initiatives, :name, :unique => true
  end
end
