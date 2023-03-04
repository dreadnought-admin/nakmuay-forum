class ApplicationController < ActionController::API
    include ActionController::Cookies
    
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    # before_action 
    before_action :authorize
    skip_before_action :authorize, only: [:current_user]


    # current_user and authorized_user 
    def current_user
        user = User.find_by(id: session[:user_id])
    end 

    def authorize 
        @current_user = User.find_by(id: session[:user_id])
        render json: { error: "Not authorized" }, status: :unauthorized unless current_user
    end

    def admin?
        @current_user.role == "admin"
    end

    def mod?
        @current_user.role == "moderator"
    end
  
    def check_if_admin
        if admin?
            true
        else
            render json: {error: "You do not have access" } 
        end
    end

    def check_if_mod
        if mod?
            true
        else 
            render json: {error: "You do not have permission to perform that action"}
        end
    end 


    private

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

     def render_not_found(error)
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 
end 
