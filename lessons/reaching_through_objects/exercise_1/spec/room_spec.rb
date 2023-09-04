require './lib/room'

RSpec.describe 'Room' do
  
  describe '#Name' do
    it 'check room name' do
      bathroom = Room.new("bathroom")

      expect(bathroom.name).to eq("bathroom")
    end
  end
end