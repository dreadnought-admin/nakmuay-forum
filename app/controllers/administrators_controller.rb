class AdministratorsController < ApplicationController
    before_action :is_admin?

    def post_index
        @posts = Post.all.order(created_at: :desc)
        render json: @posts
    end 

    def users_index
        @users = User.order(:username)
    end
    
    def admin_destroy
        User.find(params[:id]).destroy
        head :no_content
    end 

    def category_index
        @category = Category.all
        render json: @category
    end 


end
