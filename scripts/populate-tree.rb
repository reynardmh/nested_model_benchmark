
require './app/poro/tree_populator'

comment_populator = TreePopulator.new(AncestryModel)
page_populator = TreePopulator.new(ClosureTreeModel)

start = Time.now
comment_populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25)
puts "Ancestry (deep nested): #{Time.now - start}"

start = Time.now
page_populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25)
puts "Closure tree (deep nested): #{Time.now - start}"


start = Time.now
20.times do |i|
  comment_populator.populate(root_name: "Shallow Page #{i+1}", num_child: 2, depth: 3)
end
puts "Ancestry (shallow nested): #{Time.now - start}"

start = Time.now
20.times do |i|
  page_populator.populate(root_name: "Shallow Page #{i+1}", num_child: 2, depth: 3)
end
puts "Closure tree (shallow nested): #{Time.now - start}"


