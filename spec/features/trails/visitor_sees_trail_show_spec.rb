require 'rails_helper'

describe "As a visitor" do
  describe "When I visit trail show" do
    before(:each) do
      @trail = Trail.create!(name: "trail 1", length: 6, address: "111 street")
      @trip_1 = @trail.trips.create!(name: "My Hike", start_date: "02/22/2017", end_date: "02/22/2017")
      @trip_2 = @trail.trips.create!(name: "Ilana's Hike", start_date: "02/22/2017", end_date: "02/22/2017")
      @trip_3 = @trail.trips.create!(name: "Ali's Hike", start_date: "02/22/2017", end_date: "02/22/2017")
    end

    it "I see trail attributes" do
      visit trail_path(@trail)

      expect(page).to have_content(@trail.name)
      expect(page).to have_content(@trail.length)
      expect(page).to have_content(@trail.address)
    end
  end
end
