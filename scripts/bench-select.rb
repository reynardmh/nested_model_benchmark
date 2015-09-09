
require 'benchmark'

many = 10

AncestryModel.find(26).ancestors
AncestryModel.find(1).descendants
ClosureTreeModel.find(26).ancestors
ClosureTreeModel.find(1).descendants

Benchmark.bm(35) do |x|
  x.report("ancestry.ancestors") do
    many.times { AncestryModel.find(26).ancestors }
  end
  x.report("closure_tree.ancestors") do
    many.times { ClosureTreeModel.find(26).ancestors }
  end
end

Benchmark.bm(35) do |x|
  x.report("ancestry.descendants") do
    many.times { AncestryModel.find(1).descendants }
  end
  x.report("closure_tree.descendants") do
    many.times { ClosureTreeModel.find(1).descendants }
  end
end
