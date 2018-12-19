class Api::TasksController < Api::ApplicationController
    before_action :authenticate_request!

    def index
      render json: {'work?' => true}
    end
end
  