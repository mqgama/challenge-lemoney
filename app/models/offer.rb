class Offer < ApplicationRecord
  validates :advertiser_name, uniqueness: true

  def to_s
    advertiser_name
  end
end