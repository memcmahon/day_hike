require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the trips index" do
    before (:each) do
      @trip = Trip.create!(name: "My Hike", start_date: "02/22/2017", end_date: "02/22/2017")
      @trail_1 = @trip.trails.create!(name: "trail 1", length: 4, address: "111 street")
      @trail_2 = @trip.trails.create!(name: "trail 2", length: 2, address: "222 street")
      @trail_3 = Trail.create!(name: "trail 3", length: 3, address: "333 street")
    end
    it "I can click on a single trip and view details" do
      visit trips_path

      click_on(@trip.name)

      expect(current_path).to eq(trip_path(@trip))
      expect(page).to have_content(@trip.name)
      expect(page).to have_content(@trail_1.name)
      expect(page).to have_content(@trail_1.length)
      expect(page).to have_content(@trail_1.address)
      expect(page).to have_content(@trail_2.name)
      expect(page).to have_content(@trail_2.length)
      expect(page).to_not have_content(@trail_3.name)
      expect(page).to_not have_content(@trail_3.length)
      expect(page).to_not have_content(@trail_3.address)
    end

    it "I can see the total planed distance" do
      visit trip_path(@trip)

      expect(page).to have_content("Total distance: 6")
    end
  end
end
