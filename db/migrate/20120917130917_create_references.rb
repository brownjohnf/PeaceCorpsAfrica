class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :link_text
      t.references :link_target, :polymorphic => true
      t.references :link_source, :polymorphic => true

      t.timestamps
    end
  end
end
