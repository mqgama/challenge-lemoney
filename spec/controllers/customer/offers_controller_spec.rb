require 'rails_helper'

RSpec.describe Customer::OffersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user, scope: :user }

  describe 'GET#index' do
    let!(:offer1) { create(:offer) }
    let!(:offer2) { create(:offer) }
    let!(:offer3) { create(:offer) }

  
    it 'assigns all offers to objects' do
      get :index
      expect(assigns(:objects)).to contain_exactly(offer1, offer2, offer3)
    end
  end

  describe 'GET#edit' do
    let(:offer) { create(:offer) }

    before { get :edit, params: { id: offer.id } }

    it 'finds and assigns to object' do
      expect(assigns(:object)).to eql offer
    end
  end

  describe 'POST#create' do
    let(:params) do
      {
        offer: {
          advertiser_name: FFaker::NameBR.name,
          url: FFaker::Internet.http_url,
          description: FFaker::Lorem.phrase,
          start_at: Date.current,
          end_at: nil
        }
      }
    end

    it 'creates a new Offer' do
      expect { post :create, params: params }.to change(Offer, :count).by(1)
    end
  end

  describe 'PUT#update' do
    let(:offer) { create(:offer) }
    let(:params) do
      {
        id: offer.id,
        offer: {
          advertiser_name: FFaker::NameBR.name,
          url: FFaker::Internet.http_url,
          description: FFaker::Lorem.phrase,
          start_at: Date.current,
          end_at: nil,
          premium: true
        }
      }
    end

    it 'updates Offer attributes' do
      expect { put(:update, params: params); offer.reload }.to change(offer, :attributes)
    end
  end

  describe 'DELETE#destroy' do
    let!(:offer) { create(:offer) }
    let(:params) { { id: offer.id } }


    it 'destroy an Offer' do
      expect { delete(:destroy, params: params) }.to change(Offer, :count).by(-1)
    end
  end
end