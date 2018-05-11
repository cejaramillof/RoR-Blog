class CommentsController < ApplicationController
before_action :find_commentable
before_action :set_comment, only: [:read, :unread, :destroy]

    def index
      @comments = Comment.unread
    end

    def new
      @comment = Comment.new
    end

    def read
      @comment.read!
      redirect_back(fallback_location: root_path)
    end

    def unread
      @comment.unread!
      redirect_back(fallback_location: root_path)
    end

    def destroy
      @comment.destroy
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'Comment was successfully destroyed.'
    end

    def create
      @comment = @commentable.comments.new comment_params

      if @comment.save
        flash[:notice] = 'Your comment was successfully posted!'
        redirect_back(fallback_location: root_path)
      else
        flash[:notice] = "Your comment wasn't posted!"
        redirect_back(fallback_location: root_path)
      end
    end

    private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :state, :id)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
    end

end
