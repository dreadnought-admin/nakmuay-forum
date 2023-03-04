class WatchesController < ApplicationController
    skip_before_action :authorize
    
      # GET /watches
      def index
        if params[:user_id]
          watched_posts = User.find(params[:user_id]).watched_posts
          render json: watched_posts
        else
          watches = Watch.all
          render json: watches
        end
      end
    
      # GET /watches/1
      def show
        render json: @watch
      end
    
      # POST /watches
      def create
        watch = Watch.new(watch_params)
        if watch.save
          post = watch.post
          render json: post, status: :created
        else
          render json: watch.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @watch.update(watch_params)
          render json: @watch
        else
          render json: @watch.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @watch = set_watch
        @watch.destroy
        head :no_content
      end
    
      private
    
        def set_watch
          @watch = Watch.find(params[:id])
        end
    
        def watch_params
          params.require(:watch).permit(:user_id, :post_id)
        end
    end