class Customer::ActiveOffersController < Customer::BaseController

  def index
    @objects = Offer.where(status: OfferStatus::ENABLED).order(premium: :desc)
  end

  private

  def object_class
    Offer
  end
end