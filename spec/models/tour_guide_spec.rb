require 'rails_helper'

RSpec.describe TourGuide, type: :model do
  describe '.created_with(user_id)' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { FactoryGirl.create(:agency) }
    it 'saves a tour guide to database' do
      expect { TourGuide.created_with(user.id) }.to change{ TourGuide.count }.by(+1)
    end
    it 'creates a tour guide with correct attributes' do
      tour_guide = TourGuide.created_with(user.id)
      expect(tour_guide.email).to eq user.email
      expect(tour_guide.agency).to eq Agency.first
    end
  end
end
