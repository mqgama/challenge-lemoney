class Customer::OffersController < Customer::BaseController


  private

  def object_class
    Offer
  end

  def permitted_params
    if params[:offer][:end_at].to_date.blank? &&
      Date.current >= params[:offer][:start_at].to_date
      
      @status = OfferStatus::ENABLED
    else
      @status = OfferStatus::DISABLED
    end

    params.require(:offer).permit(:advertiser_name, :url, :description,
      :start_at, :end_at, :premium).merge(status: @status)
  end

  def after_save_path
    offers_path
  end
end