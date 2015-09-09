puts "Resetting DB"
puts "------------"
puts `rake db:reset`

puts "\nPopulating data"
puts   "---------------"
require_relative 'populate-tree'

puts "\nSelect benchmark"
puts   "----------------"
require_relative 'bench-select'

puts "\nMove node benchmark"
puts   "-------------------"
require_relative 'bench-move-node'