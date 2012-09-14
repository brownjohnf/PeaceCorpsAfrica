class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :author_id
      t.text :content
      t.text :html
      t.integer :page_id

      t.timestamps
    end
  end
end
