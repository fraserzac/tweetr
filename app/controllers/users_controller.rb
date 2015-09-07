class UsersController < ApplicationController
before_action :check_if_logged_in, :only => [:edit, :edit]
	
	def new
		@user = User.new
	end

	def create
    @user = User.new user_params
    if @user.save # Check if the user is valid (per the validations in the model)
      redirect_to root_path
  	  else
    	  render :new
    	end
  	end

   def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  	end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end

