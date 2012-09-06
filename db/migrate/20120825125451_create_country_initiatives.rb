class CreateCountryInitiatives < ActiveRecord::Migration
  def change
    create_table :country_initiatives do |t|
      t.integer :country_id
      t.string :country_url
      t.integer :initiative_id
      t.string :initiative_url
      t.date :join_date

      t.timestamps
    end

    add_index :country_initiatives, [ :country_id, :initiative_id ], :unique => true
  end
end
