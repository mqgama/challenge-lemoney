require 'rails_helper'
require 'validate_url/rspec_matcher'

RSpec.describe Offer do
  context 'validations' do
    it { is_expected.to validate_presence_of :advertiser_name }
    it { is_expected.to validate_presence_of :url }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :start_at }
    
    it { is_expected.to validate_url_of :url  }

    context 'when is there Offer with same advertiser_name' do
      let(:offer) { create(:offer) }

      subject { described_class.new advertiser_name: offer.advertiser_name }

      it { is_expected.to validate_uniqueness_of :advertiser_name }
    end
  end
end