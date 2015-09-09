
require 'benchmark'

many = 10

def ct_move_node(root_id, dest_id)
  x = ClosureTreeModel.find(root_id)
  x.parent = ClosureTreeModel.find(dest_id)
  x.save
  x.parent = nil
  x.save
end

def an_move_node(root_id, dest_id)
  x = AncestryModel.find(root_id)
  x.parent = AncestryModel.find(dest_id)
  x.save
  x.parent = nil
  x.save
end

root_id, dest_id = 27, 26

# warm things up
ct_move_node(root_id, dest_id)
an_move_node(root_id, dest_id)

puts "\nMoving a node with 14 descendants:"
Benchmark.bm(35) do |x|
  x.report("ancestry - move node") do
    many.times { an_move_node(root_id, dest_id) }
  end
  x.report("closure_tree - move node") do
    many.times { ct_move_node(root_id, dest_id) }
  end
end

root_id, dest_id = 1, 30

# warm things up
ct_move_node(root_id, dest_id)
an_move_node(root_id, dest_id)

puts "\n\nMoving a node with 25 descendants:"
Benchmark.bm(35) do |x|
  x.report("ancestry - move node") do
    many.times { an_move_node(root_id, dest_id) }
  end
  x.report("closure_tree - move node") do
    many.times { ct_move_node(root_id, dest_id) }
  end
end
