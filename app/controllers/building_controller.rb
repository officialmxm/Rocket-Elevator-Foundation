class BuildingController < ApplicationController
  def customer
    @customer = Customer.new
    @customers = Customer.all
    @buildings = []
    @customerId = params[:customer_id].to_s

    if @CustomerId != " "
       Building.where(customer_id: @customerId).each do |b|
        @buildings.append(b.id)
        puts @CustomerId
      end
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {buildings: @buildings}
        }
      end
    end
  end
end
