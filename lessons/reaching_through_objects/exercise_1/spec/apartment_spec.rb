require './lib/room'
require './lib/apartment'

RSpec.describe 'Apartment' do
  
  describe '#Instance' do
    it 'check apartment Instance' do
      apartment = Apartment.new

      expect(apartment).to be_instance_of Apartment
    end
  end

  describe '#rented' do
    it 'check if apartment rented' do
      apartment = Apartment.new

      expect(apartment.rented?).to be(false)

      apartment.rent

      expect(apartment.rented?).to be(true)
    end
  end

  describe '#Rooms' do
    it 'has 4 rooms' do
      apartment = Apartment.new
      bathroom = Room.new("bathroom")
      laundry = Room.new("laundry")
      kitchen = Room.new("kitchen")
      bedroom = Room.new("bedroom")

      apartment.add_room(bathroom)
      apartment.add_room(laundry)
      apartment.add_room(kitchen)
      apartment.add_room(bedroom)

      expect(apartment.rooms).to be(bathroom, laundry, kitchen, bedroom)
      expect(apartment.list_rooms_by_name_alphabetically). to eq(["bathroom", "bedroom", "kitchen", "laundry"])
    end
  end

end