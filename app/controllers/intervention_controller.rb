class InterventionController < ApplicationController
  def intervention
    @intervention = Intervention.new
  end
  def customer
    @customer = Customer.new
    @customers = Customer.all
    @customerId = params[:customer_id].to_s
    @buildings = []

    if @customerId != " "
       Building.where(customer_id: @customerId).each do |b|
        @buildings.append(b.id)
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
  
  def getCustomers
    @customersSelect = Array.new
    @customersSelect.append("Select")

    Customer.all.each do |c|
      @customersSelect.append([c.company_name, c.id])
    end
    return @customersSelect
  end
  helper_method :getCustomers
end
