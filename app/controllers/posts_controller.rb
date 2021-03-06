class PostsController < ApplicationController
  before_action :find_post, only: [:show,:edit,:update,:destroy, :upvote]
  before_action :authenticate_user!, except: [:index,:show] 

  def index
    @posts = Post.all.order("created_at DESC")  end 
  def new
    @post = Post.new
  end 

  def show
  end 

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render 'new', notice: "Post created successfully"
    else 
      render 'new'
    end 
  end 

  def edit

  end 

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully"
    else 
      render 'new' 
    end 
  end 

  def destroy
    @post.destroy
    redirect_to root_path 
  end 

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  private

  def post_params
    params.require(:post).permit(:image)
  end 

  def find_post
    @post = Post.find(params[:id])
  end 
end
