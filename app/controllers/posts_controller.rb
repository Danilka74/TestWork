class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :create, :update]

  def index
    @posts = Post.all
  end

  def show
    @childrens = @post.subtree
  end

  def new
    @parent = Post.find_by(url: params[:url])
    @post = Post.new
  end

  def create
    #как проверять от текущего родителя
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post.url)
    else
      render 'new'
    end

  end

  def edit
  end

  def update

    if @post.update(post_params)
      redirect_to post_path(@post.url)
    else
      render 'edit'
    end

  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :name, :parent_id)
  end

  def set_post
    @post = Post.find_by(url: params[:url])
  end
  
end
