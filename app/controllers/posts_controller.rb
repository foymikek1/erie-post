class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
  end

  def create
   @post = Post.new(post_params)
   @post.save

   redirect_to post_path(@post)
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_list)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end