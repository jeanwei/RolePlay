require 'rails_helper'

RSpec.describe TouristsController, type: :controller do
  describe 'GET #edit' do
    let(:stitch) { FactoryGirl.create(:tourist) }
    before(:each) do
      sign_in stitch.user
      get :edit, id: stitch
    end
    it 'assigns @tourist to current user' do
      expect(assigns(:tourist)).to eq stitch
    end
    it 'renders edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update - successful' do
    let(:stitch) { FactoryGirl.create(:tourist) }
    before(:each) do 
      sign_in stitch.user
      patch :update, id: stitch, tourist: { year_of_birth: '2000' }
    end
    it 'updates the user profile' do
      stitch.reload
      expect(stitch.year_of_birth).to eq '2000'
    end
    it 'redirects to homepage' do
      expect(response).to redirect_to(tourist_home_path)
    end
  end

  describe 'PATCH #assigned_to - successful' do
    let(:stitch) { FactoryGirl.create(:tourist) }
    let(:lilo) { FactoryGirl.create(:tour_guide) }
    before(:each) do 
      sign_in lilo.user
      patch :assigned_to, tourist_id: stitch, entity: 'tour_guide', id: lilo
    end
    it 'updates the user profile' do
      stitch.reload
      expect(stitch.tour_guide).to eq lilo
    end
    it 'redirects to homepage' do
      expect(response).to redirect_to(agency_people_home_path)
    end
  end
end