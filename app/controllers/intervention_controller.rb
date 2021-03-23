class InterventionController < ApplicationController
  def intervention
    @intervention = Intervention.new
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