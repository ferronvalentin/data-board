class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:create]
  before_action :admin_only, :except => [:show, :faq]
  # before_filter :authorize_admin, :only => :create
  prepend_before_filter :require_no_authentication, only: [:cancel]


  def index
    @users = User.all
  end

  def new
    @user = User.new
    # @town = current_user.town || Town.new
  end

  def create
    @user = User.new(user_params)
    # @user.user = current_user

    if @user.save
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, :alert => "Access denied."
      end
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(secure_params)
  #     redirect_to users_path, :notice => "User updated."
  #   else
  #     redirect_to users_path, :alert => "Unable to update user."
  #   end
  # end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to users_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def faq
    render template: "client/faq"
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

  def user_params
    params.require(:user).permit(:first_name)
  end

  # def authorize_admin
  #   return unless !current_user.admin?
  #   redirect_to root_path, alert: 'Admins only!'
  # end

  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end
end
