require 'rails_helper'

RSpec.describe Tourist, type: :model do
  describe '.created_with(user_id)' do
    let(:user) { FactoryGirl.create(:user) }
  
    it 'saves a job developer to database' do
      expect { Tourist.created_with(user.id) }.to change{ Tourist.count }.by(+1)
    end
    it 'creates a job developer with correct attributes' do
      tourist = Tourist.created_with(user.id)
      expect(tourist.email).to eq user.email
      expect(tourist.year_of_birth).to eq nil
      expect(tourist.tour_guide).to eq nil
      expect(tourist.translator).to eq nil
    end
  end
end
