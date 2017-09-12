class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.new(user_id: current_user.id, content: params[:content])
    if post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end
end
