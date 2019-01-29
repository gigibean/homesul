class CommentsController < ApplicationController
    before_action :set_comment ,only:[:destroy]
    def create
        @comment = Comment.new(comment_params)
        @comment.comment = params[:comment][:comment]
        @comment.user = current_user
        @comment.commentable_type = params[:comment][:commentable_type]
        @comment.commentable_id = params[:comment][:commentable_id]
        @comment.save
        redirect_to "/#{@comment.commentable_type[0..100].downcase}/#{@comment.commentable_id}"
    end

    def destroy
        @comment = Comment.find params[:id]
        @comment.destroy
        
    end
    
    private
    def set_comment
        @comment = Commment.find params[:id]
    end
    
    def comment_params
        params.require(:comment).permit(:commentable_id, :commentable_type,:comment)
    end
end
