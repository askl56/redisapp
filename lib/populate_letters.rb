class PopulateLetters

  attr_reader :letters

  def initialize(depth = 1)
    @letters = []
    @depth = depth
  end

  def execute(&block)
    spawn_letter "", &block
  end

  def spawn_letter(prefix, &block)
    "A".upto "Z" do |letter|
      new_letter = prefix + letter
      letters << new_letter
      yield new_letter if block_given?
      spawn_letter(new_letter, &block) if new_letter.length < @depth
    end
  end
end
