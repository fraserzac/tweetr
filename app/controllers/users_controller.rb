class UsersController < ApplicationController
before_action :check_if_logged_in, :only => [:edit, :followed]
before_action :check_if_admin, :only => [:index]

  def index
    @user = User.new
  end
	
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

  def followed
    check_if_logged_in
    @followed = @current_user.active_relationships
    render :followed
  end

  def follow
    check_if_logged_in
    @current_user.active_relationships.create(followed_id: params[:id])
    redirect_to followed_path
  end

  def unfollow
    check_if_logged_in
    @current_user.active_relationships.find_by(followed_id: params[:id]).destroy
    redirect_to followed_path
  end

   def check_if_logged_in
    redirect_to root_path unless @current_user.present?
  	end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end







