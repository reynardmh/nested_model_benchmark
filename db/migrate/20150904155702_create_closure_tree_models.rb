class CreateClosureTreeModels < ActiveRecord::Migration
  def change
    create_table :closure_tree_models do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps null: false
    end
    add_index :closure_tree_models, :parent_id, name: "closure_tree_models_parent_idx"
  end
end
