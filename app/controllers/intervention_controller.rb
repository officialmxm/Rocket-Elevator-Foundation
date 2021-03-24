class InterventionController < ApplicationController
  def intervention
    @intervention = Intervention.new
  end
  
  #Gather all customer in an Array 
  def getCustomers
    @customersSelect = Array.new
    @customersSelect.append("Select")

    Customer.all.each do |c|
      @customersSelect.append([c.company_name, c.id])
    end
    return @customersSelect
  end
  
  #define the func variable for the view
  helper_method :getCustomers
  
  #Gather all building related to 'customer_id' in an Array 
  def getBuildings
    @customer = Customer.new
    @customers = Customer.all
    @customerId = params[:customer_id].to_s
    @buildingList = []

    if @customerId != " "
       Building.where(customer_id: @customerId).each do |b|
      @buildingList.append(b.id)
      end
      render json: {buildings: @buildingList}
    end
  end

  #Gather all battery related to 'building_id' in an Array 
  def getBatteries
    @building = Building.new
    @buildings = Building.all
    @buildingId = params[:building_id].to_s
    @batteryList = []

    if @buildingId != " "
       Battery.where(building_id: @buildingId).each do |p|
       @batteryList.append(p.id)
     end
     render json: {batteries: @batteryList}
   end
  end

  #Gather all columns related to 'battery_id' in an Array 
  def getColumns
    @battery = Battery.new
    @batteries = Battery.all
    @batteryId = params[:battery_id].to_s
    @columnList = []

    if @batteryId != " "
       Column.where(battery_id: @batteryId).each do |c|
       @columnList.append(c.id)
     end
     render json: {columns: @columnList}
   end
  end

  #Gather all elevators related to 'elevator_id' in an Array
  def getElevators
    @column = Column.new
    @columns = Column.all
    @columnId = params[:column_id].to_s
    @elevatorList = []

    if @columnId != " "
       Elevator.where(column_id: @columnId).each do |e|
       @elevatorList.append(e.id)
     end
     render json: {elevators: @elevatorList}
   end
  end
end
