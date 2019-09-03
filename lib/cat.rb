class Cat
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name, :owner#, :mood
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    self.mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

end
