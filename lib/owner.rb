class Owner
  # code goes here
  attr_reader :name, :species
  attr_accessor :pets, :dog, :cat
  @@all = []

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
    # @@pets = {dogs: [], cats: [] }
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  # def pets
  #   @@pets
  # end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
   self.dogs.each do |walked|
     walked.mood = "happy"
   end
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end

  def sell_pets
    @pets = self.dogs + self.cats
    self.pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
  end
end
