class PostsController < ApplicationController
  before_action :load_post, only:  [:destroy]
  def index
    @posts = Post.all.order(id: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path, flash: {error: '投稿に失敗しました'}
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      redirect_to root_path, flash: {error: '削除に失敗しました'}
    end
  end
private
  def load_post
    @post = Post.find(request.path_parameters[:id])
  end

  def post_params
    params.require(:post).permit(:id, :content)
  end
end
