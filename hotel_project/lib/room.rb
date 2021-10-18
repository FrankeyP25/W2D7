class Room
  def initialize(n)
    @capacity = n
    @occupants = []
  end
  attr_reader :capacity , :occupants

  def full?
    if @occupants.length == @capacity
      true
    else
      false
    end
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(person)
    if !full?
      @occupants << person
      true
    else
      false
    end
  end
end


