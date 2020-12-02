module Customer::OffersHelper

  def check_status(offer)
    return true if offer.status == OfferStatus::ENABLED
  end
end