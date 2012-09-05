class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :html
      t.integer :locked_by
      t.datetime :locked_at

      t.timestamps
    end
  end
end
