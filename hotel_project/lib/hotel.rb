require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each { |room, capacity| @rooms[room] = Room.new(capacity) }
  end

  attr_reader :rooms

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def room_exists?(room)
    @rooms.include?(room)
  end

  def check_in(person, room)
    if !room_exists?(room)
      print 'sorry, room does not exist'
    else
      if !@rooms[room].full?
        @rooms[room].add_occupant(person)
        print 'check in successful'
      else
        print 'sorry, room is full'
      end
    end
  end

  def has_vacancy?
    rooms = @rooms.keys
    if rooms.all? { |room| @rooms[room].full? }
      false
    else
      true
    end
  end

  def list_rooms
    @rooms.each do |room, occupants|
      puts "#{room} #{occupants.available_space}"
    end
  end
end
