class Apartment
  attr_reader :rented, :rooms
  
  def initialize(rented = false)
    @rented = rented
    @rooms = []
  end

  def rent
    @rented = true
  end

  def rented?
    @rented
  end

  def add_room(room)
    @rooms << room
  end

  def list_rooms_by_name_alphabetically
    @rooms.map {|room| room.name.sort}
    end
end