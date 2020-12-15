class Character
  attr_reader :name, :actor, :salary
  
  def initialize(attr_hash)
    @name = attr_hash[:name]
    @actor = attr_hash[:actor]
    @salary = attr_hash[:salary]
  end
end
