class VotesController < ApplicationController
    skip_before_action :authorize

    def index
        render json: Vote.all
    end 

    def show
        render json: Vote.find(params[:id])
    end 

    def create
        vote = Vote.create!(vote_params)
        render json: vote, staus: :created
    end 

    def destroy
        vote = Vote.find(params[:id])
        vote.destroy
        head :no_content
    end 

    private

    def vote_params
        params.permit(:user_id, :post_id)
    end 
end
