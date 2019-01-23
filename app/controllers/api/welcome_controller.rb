class Api::WelcomeController < Api::ApplicationController
    def index
        render json: {
            name: "Task Manager",
            version: "1.0.0"
        }
    end
end