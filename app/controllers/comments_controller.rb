class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET posts/1/comments
  def index
    @comments = @post.comments
  end

  # GET posts/1/comments/new
  def new
    @comment = @post.comments.build
  end

  # POST posts/1/comments
  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
    redirect_to post_path(@post)
  end

  # DELETE posts/1/comments/1
  def destroy
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params
        .require(:comment)
        .permit(:comment)
        .merge(post_id: params[:post_id])
    end
end
