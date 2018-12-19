class Api::AuthenticationController < Api::ApplicationController
    protect_from_forgery with: :null_session
    
    def authenticate_employee
      employee = Employee.find_for_database_authentication(email: params[:email])
      if employee and employee.valid_password?(params[:password])
        render json: payload(employee)
      else
        render json: {errors: ['Invalid Email/Password']}, status: :unauthorized
      end
    end
  
    private
  
    def payload(employee)
      return nil unless employee and employee.id
      {
        auth_token: JsonWebToken.encode({employee_id: employee.id}),
        employee: {id: employee.id, email: employee.email}
      }
    end
  end