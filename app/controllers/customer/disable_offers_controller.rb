class Customer::DisableOffersController < Customer::BaseController
  def create
    @object = Offer.find(params[:offer_id])

    if @object.update(disable_offer_params)
      redirect_to customer_offers_path, notice: I18n.t("notices.offer.status.#{disable_offer_params[:status]}")
    else
      redirect_to customer_offers_path, alert: I18n.t("notices.offer.status.error")
    end
  end

  private

  def object_class
    Offer
  end 

  def disable_offer_params
    params.require(:offer).permit(:status).merge(end_at: Date.current)
  end
end