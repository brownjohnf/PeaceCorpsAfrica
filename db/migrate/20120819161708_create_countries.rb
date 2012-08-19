class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.integer :page_id
      t.boolean :active

      t.timestamps
    end
  end
end
