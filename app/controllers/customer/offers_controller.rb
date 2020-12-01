class Customer::OffersController < Customer::BaseController
  
  private
  
  def object_class
    Offer
  end

  def permitted_params
    params.require(:offer).permit(:advertiser_name, :url, :description,
      :start_at, :end_at, :premium)
  end

  def after_save_path
    offers_path
  end
end