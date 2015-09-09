class TreePopulator
  attr_accessor :klass # nested model class

  def initialize(klass)
    @klass = klass
  end

  def create_children(parent, n, depth)
    return if depth <= 0
    n.times do |i|
      child = parent.children.create(name: "#{parent.name}.#{i+1}")
      # puts child.name
      create_children(child, n, depth - 1)
    end
  end

  def populate(root_name: 'Page 1', num_child: 2, depth: 2)
    root = @klass.create(name: root_name)
    # puts root.name
    create_children(root, num_child, depth)
  end
end