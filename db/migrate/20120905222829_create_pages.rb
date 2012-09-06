class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :html, :default => '<p>No content.</p>'
      t.integer :country_id
      t.integer :locked_by
      t.datetime :locked_at

      t.timestamps
    end

    add_index :pages, :title
    add_index :pages, [ :title, :country_id ], :unique => true
  end
end
