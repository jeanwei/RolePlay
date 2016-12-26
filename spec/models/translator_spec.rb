require 'rails_helper'

RSpec.describe Translator, type: :model do
  describe '.created_with(user_id)' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { FactoryGirl.create(:agency) }
    it 'saves a translator to database' do
      expect { Translator.created_with(user.id) }.to change{ Translator.count }.by(+1)
    end
    it 'creates a case manager with correct attributes' do
      translator = Translator.created_with(user.id)
      expect(translator.email).to eq user.email
      expect(translator.agency).to eq Agency.first
    end
  end
end
