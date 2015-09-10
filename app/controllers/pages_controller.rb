class PagesController < ApplicationController

    def new 
      @post = User.new
    end

    def home
    if session[:user_id]
      @user = User.find session[:user_id]
    else
      redirect_to login_path
    end

    def create #create post and append to the home screen
      @post = Post.create post_params
      @current.user.post << @post
      redirect_to home_path
    end

    private
    def post_params
    params.require(:posts).permit(:input)
  end
end
 end
 
