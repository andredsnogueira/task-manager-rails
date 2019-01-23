class WelcomeController < ApplicationController
    def index
        redirect_to :controller => 'tasks', :action => 'index'
    end
end