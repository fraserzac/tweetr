class PostsController < ApplicationController

	def index
    check_if_logged_in
		@posts = Post.order( :created_at ).reverse_order
	end

	def new
		check_if_logged_in
    @post = Post.new
	end

	def show
    response = Post.find params[:id]
    end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to posts_path
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end

  def create
    @post = Post.new post_params
    @post.user_id = @current_user.id 
    if @post.save # Check if the user is valid (per the validations in the model)
        redirect_to posts_path
  	else
        render :new
    end
  end

  def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
