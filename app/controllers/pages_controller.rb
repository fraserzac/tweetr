class PagesController < ApplicationController
    def home
  	if session[:user_id]
  		@user = User.find session[:user_id]
  	end

  	def new 
  		@post = Post.new
  	end

  	
  	def create
  		@post = Post.create post_params
  		redirect_to home_path
  	end

  	 private
 	 def post_params
    params.require(:tweetr).permit(:email, :name, :password)
  end

  end
end
 
 
 
