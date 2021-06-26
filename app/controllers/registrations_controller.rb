class RegistrationsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to users_path
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to new_user_path
    end
  end

  def user_params
    user_param = params.require(:user).permit(:first_name,
                                              :last_name,
                                              :email,
                                              :phone_number,
                                              :role,
                                              :password)
    user_param.delete(:password) unless params[:user][:password].present?
    user_param
  end
end