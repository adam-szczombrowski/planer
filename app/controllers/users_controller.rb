class UsersController < ApplicationController
  before_filter :require_permission, only: [:edit, :show, :update, :destroy]


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Planer!'
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'You edited your data successfully!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'Your account has been deleted'
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_permission
      if current_user != User.find(params[:id])
        flash[:danger] = 'This is not your account'
        redirect_to root_path
      end
    end
end
