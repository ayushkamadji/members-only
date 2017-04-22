class PostsController < ApplicationController
  before_action :redirect_guest, only: [:create]

  def index
    @posts = Post.all
    @post ||= Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post successfuly submitted"
      redirect_to root_url
    else
      @posts = Post.all
      render :index
    end

  end

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

  
  private
    

    def redirect_guest
      redirect_to sign_in_path unless signed_in?
    end
end
