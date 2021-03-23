class BuildingController < ApplicationController
  def customer
    @customer = Customer.new
    @customers = Customer.all
    @buildings = []
    @customersId = params[:customer_id]

    if params[:customer_id].present?
      @cities = Customer.find(params[:customer_id]).cities
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {buildings: @buildings}
        }
      end
    end
end
