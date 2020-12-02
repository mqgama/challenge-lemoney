class Customer::OffersController < Customer::BaseController

  def update
    @object = described_class.find params[:id]

    if @object.update permitted_params
      respond_with :customer, @object
    else
      render :edit
    end
  end

  private

  def permitted_params
    if params[:offer][:end_at].to_date.blank? &&
      (Date.current >= params[:offer][:start_at].to_date if params[:offer][:start_at]
        .to_date.present?)
      
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