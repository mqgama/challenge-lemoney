class Customer::BaseController < ApplicationController
  before_action :authenticate_user!

  layout 'dashboard'

  def index
    @objects = described_class.all
  end

  def show
    @object = described_class.find params[:id]
  end

  def new
    @object = described_class.new
  end

  def edit
    @object = described_class.find params[:id]
  end

  def create
    @object = described_class.new permitted_params

    if @object.save
      respond_with :customer, @object
    else
      render :new
    end
  end

  def update
    @object = described_class.find params[:id]

    if @object.update permitted_params
      respond_with :customer, @object
    else
      render :edit
    end
  end

  def destroy
    @object = described_class.find params[:id]

    @object.destroy
    respond_with :customer, @object
  end

  private

  def described_class
    controller_name.singularize.camelize.constantize
  end
end
