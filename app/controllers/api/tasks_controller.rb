class Api::TasksController < Api::ApplicationController
    before_action :authenticate_request!

    # def index
    #   render json: Task.all
    # end

    # def show
    #   render json: Task.find(params[:id])
    # end 

    def employees
      employee = Employee.find(employee_id_in_token?)
      render json: employee.tasks
    end

    def update
      task = Employee.find(employee_id_in_token?).tasks.where(id: params[:id])
      case params[:field]
      when 'start_hour'
        task.update(start_hour: Time.now)
        render json: task
      when 'end_hour'
        task.update(end_hour: Time.now)
        render json: task
      end
    end
end
  