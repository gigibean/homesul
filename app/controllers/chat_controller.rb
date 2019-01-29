class ChatController < ApplicationController
    def index
        @post_all=Chat.all
    end
    def new
    @post = Chat.new
    @token=form_authenticity_token
    end
    def show
    end
    def create
        @post = Chat.new(post_params)
        @post.user = current_user
        @post.save
        if @post.save
            redirect_to '/chat/index'
        else
            render "new"
        end
    end
end
