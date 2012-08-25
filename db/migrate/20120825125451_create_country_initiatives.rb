class CreateCountryInitiatives < ActiveRecord::Migration
  def change
    create_table :country_initiatives do |t|
      t.integer :country_id
      t.integer :initiative_id
      t.date :join_date

      t.timestamps
    end

    add_index :country_initiatives, [ :country_id, :initiative_id ], :unique => true
  end
end
