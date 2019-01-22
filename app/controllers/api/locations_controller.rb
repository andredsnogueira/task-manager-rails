class Api::LocationsController < Api::ApplicationController
    before_action :authenticate_request!

    def location
        employee = Employee.find(employee_id_in_token?)
        if employee
            location = Location.create(lat: params[:lat], long: params[:long], speed: params[:speed], date: Time.now, employee_id: employee.id)
            render json: location, status: :ok
        end
    end
  end
  