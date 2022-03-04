class ApplicationController < ActionController::Base
    include SessionsHelper
    def home
        render 'static_pages2/home'
    end
end
