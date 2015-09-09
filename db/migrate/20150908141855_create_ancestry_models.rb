class CreateAncestryModels < ActiveRecord::Migration
  def change
    create_table :ancestry_models do |t|
      t.string :name
      t.string :ancestry
      t.timestamps null: false
    end
    add_index :ancestry_models, :ancestry, name: 'ancestry_models_ancestry_idx'
  end
end
