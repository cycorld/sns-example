class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('created_at desc')
    @posts_count = current_user.posts.count
  end

  def create
    post = Post.new(user_id: current_user.id, content: params[:content])
    if post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end
end
