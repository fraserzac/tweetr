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
      @current.user.post << @post
  		redirect_to home_path
  	end

     def show
      @post = Post.find params[:id]
    end

  	 private
 	 def post_params
    params.require(:posts).permit(:input)
  end

  end
end
 
 
 
