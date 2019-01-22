class Api::NotificationsController < Api::ApplicationController
    before_action :authenticate_request!

    def employees
        employee = Employee.find(employee_id_in_token?)
        render json: employee.notifications, status: :ok
    end
end
  