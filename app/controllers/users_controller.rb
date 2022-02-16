class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @posts_count = Post.where(user_id: @user.id).count
    @following_count = User.where(:id => [@user.following]).count
    @follower_count = User.where(:id => [@user.followers]).count
  end
end
