class LikesController < ApplicationController
    before_action :authenticate_user!
    # def create
    #     if Like.find_by(user: current_user, drink_id: params[:id])
    #         Like.create!(user: current_user, drink_id: params[:id])
    #     end
    # end
    # def destroy
    #     unless Like.find_by(user: current_user, drink_id: params[:id])
    #         Like.find_by(user: current_user, drink_id: params[:id]).destroy
    #     end
    # end
    def like_toggle
        like = Like.find_by(user: current_user, drink_id: params[:id])
        if like.nil?
            Like.create!(user: current_user, drink_id: params[:id])
        else
            like.destroy
        end
        redirect_to drink_url(params[:id])
    end
    
end
