class Api::CompaniesController < Api::ApplicationController
    before_action :authenticate_request!

    def current
        employee = Employee.find(employee_id_in_token?)
        render json: employee.company, status: :ok        
    end
  end
  