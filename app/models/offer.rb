class Offer < ApplicationRecord
  validates :advertiser_name, uniqueness: true
  validates :advertiser_name, :url, :description, :start_at, presence: true

  has_enumeration_for :status, with: OfferStatus, create_helpers: true

  def to_s
    advertiser_name
  end
end