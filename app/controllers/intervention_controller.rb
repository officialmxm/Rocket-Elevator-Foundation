class InterventionController < ApplicationController

  
  def intervention
    @intervention = Intervention.new
  end
  
  def create
    
    @intervention = Intervention.new(intervention_params)
    @intervention.author = current_user.id
    @buildingID = @intervention.buildings_id
    @batteryID =  @intervention.batteries_id
    @columnID = @intervention.columns_id
    @elevatorID = @intervention.elevators_id

    if (@intervention.elevators_id != nil && @intervention.elevators_id != " ")
        @intervention.buildings_id, @intervention.batteries_id, @intervention.columns_id = nil
  
    elsif (@intervention.columns_id != nil && @intervention.columns_id != " ")
        # make battery, building, elevator null
        @intervention.elevators_id, @intervention.batteries_id, @intervention.buildings_id = nil
    elsif (@intervention.batteries_id != nil && @intervention.batteries_id != " ")
        # make building, column, elevator null
        @intervention.columns_id, @intervention.elevators_id, @intervention.buildings_id = nil
    elsif (@intervention.buildings_id != nil && @intervention.buildings_id != " ")
        # make elevator, column, battery null
      @intervention.columns_id, @intervention.batteries_id, @intervention.elevators_id = nil
    end



    if @intervention.save!
      client = ZendeskAPI::Client.new do |client|
          client.url = ENV["zendesk_url"]
          client.username = ENV["zendesk_username"]
          client.token = ENV["zendesk_auth_token"]
      end
      ZendeskAPI::Ticket.create!(client, 
      :subject => "Intervention",
      :comment => { 
        :value => " 
        Intervention Request: \n- Requester: #{@intervention.author}\n- Customer: #{Customer.find(@intervention.customers_id).company_name}\n- Building ID: #{@buildingID} \n- Battery ID: #{@batteryID}\n- Column ID:  #{@columnID} \n- Elevator ID: #{@elevatorID}\n- Assigned Employee: #{@intervention.employees_id} \n\nDescription: #{@intervention.report}"
        }, 
      :requester => client.current_user.id,
      :priority => "normal",
      :type => "problem"
      )
      redirect_to main_app.root_path, notice: "Intervention created!"
    else    
        redirect_to "/interventions", notice: "Intervention did not save!"
    end

  end
  #Gather all customer in an Array 
  def getCustomers
    @customersSelect = Array.new

    Customer.all.each do |c|
      @customersSelect.append([c.company_name, c.id])
    end
    return @customersSelect
  end

  def getEmployees
    @employeeSelect = Array.new

    Employee.all.each do |e|
      @employeeSelect.append([e.first_name + ' ' + e.last_name, e.id])
    end
    return @employeeSelect
  end
  
  #define the func variable for the view
  helper_method :getCustomers
  helper_method :getEmployees
  
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
  
  private
  def intervention_params
    params.require(:intervention).permit(:customers_id, :buildings_id, :batteries_id, :columns_id, :elevators_id, :report, :employees_id)
  end
end
