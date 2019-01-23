class Api::TasksController < Api::ApplicationController
    before_action :authenticate_request!

    def employees
      employee = Employee.find(employee_id_in_token?)
      render json: employee.tasks.where.not(status: 0), status: :ok
    end

    def update
      task = Employee.find(employee_id_in_token?).tasks.where(id: params[:id])
      case params[:field]
      when 'start_hour'
        task.update(start_hour: Time.now)
        render json: nil, status: :no_content
      when 'end_hour'
        task.update(end_hour: Time.now)
        render json: nil, status: :no_content
      when 'completed'
        task.update(status: :completed)
        render json: nil, status: :no_content
      when 'doing'
        task.update(status: :doing)
        render json: nil, status: :no_content
      when 'not_started'
        task.update(status: :not_started)
        render json: nil, status: :no_content
      when 'partial_complete'
        task.update(status: :partial_complete)
        render json: nil, status: :no_content
      else
        render json: {
          'status': 'Bad Request'
        }, status: :bad_request
      end
    end

    def today
      beginning_of_day = Date.today.beginning_of_day
      end_of_day = beginning_of_day.end_of_day
      employee = Employee.find(employee_id_in_token?)
      tasks = employee.tasks.where(deadline: beginning_of_day..end_of_day).where.not(status: 0)
      render json: tasks
    end
  end
  