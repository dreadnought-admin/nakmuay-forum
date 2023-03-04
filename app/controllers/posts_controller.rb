class PostsController < ApplicationController

    skip_before_action :authorize, only: [:index, :show]
    wrap_parameters format: []

    def index
        render json: Post.all
    end 

    def show
        render json: find_posts
    end 

    def create
        post = Post.create(post_params)
        render json: post, status: :created
    end 

    def update
        post = find_posts
        if post.update(post_params)
            render json: post
        else
            render json: post.errors, status: :unprocessable_entity
        end 
    end 

    def destroy
        post = find_posts
        post.destroy!
        head :no_content
    end 

    def user_posts
        user = User.find(params[:id])
        posts = Post.where("user_id =?", params[:id])
    end 

    def randomized
        render json: Post.limit(8).order("RANDOM()")
    end 

    private

    def post_params
        params.permit(
            :title, :post_content
        )
    end 

    def find_posts
        post = Post.find(params[:id])
    end 


end
