class Api::ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    attr_reader :current_employee

    protected
    def authenticate_request!
        unless employee_id_in_token?
            render json: { errors: ['Not Authenticated'] }, status: :unauthorized
            return
        end
        @current_employee = Employee.find(auth_token[:employee_id])
    rescue JWT::VerificationError, JWT::DecodeError
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

    private
    def http_token
        @http_token ||= if request.headers['Authorization'].present?
            request.headers['Authorization'].split(' ').last
        end
    end

    def auth_token
        @auth_token ||= JsonWebToken.decode(http_token)
    end

    def employee_id_in_token?
        http_token && auth_token && auth_token[:employee_id].to_i
    end
end
