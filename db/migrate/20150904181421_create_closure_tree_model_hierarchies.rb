class CreateClosureTreeModelHierarchies < ActiveRecord::Migration
  def change
    create_table :closure_tree_model_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :closure_tree_model_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "closure_tree_model_anc_desc_idx"

    add_index :closure_tree_model_hierarchies, [:descendant_id],
      name: "closure_tree_model_desc_idx"
  end
end
