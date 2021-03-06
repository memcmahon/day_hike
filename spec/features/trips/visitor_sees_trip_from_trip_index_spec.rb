require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the trips index" do
    before (:each) do
      @trip = Trip.create!(name: "My Hike", start_date: "02/22/2017", end_date: "02/22/2017")
      @trail_1 = @trip.trails.create!(name: "trail 1", length: 6, address: "111 street")
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

      expect(page).to have_content("Total distance: 8")
    end

    it "I can see the average hiking distance" do
      visit trip_path(@trip)

      expect(page).to have_content("Average hiking distance: 4")
    end

    it "I can see the longest hiking distance" do
      visit trip_path(@trip)

      expect(page).to have_content("Longest hiking distance: 6")
    end

    it "I can see the shortest hiking distance" do
      visit trip_path(@trip)

      expect(page).to have_content("Shortest hiking distance: 2")
    end

    it "has a list of hike names" do
      visit trip_path(@trip)

      within("trail-list")
        expect(page).to have_content(@trail_1.name)
        expect(page).to have_content(@trail_2.name)
    end
  end
end
