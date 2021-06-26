class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = params[:user]
    @user = User.find_by(first_name: user[:first_name],
                         last_name: user[:last_name],
                         password: user[:password])
    if @user
      flash[:notice] = 'Login successfully'
      redirect_to user_path(@user)
    else
      render json: { error: 'Could not login due to name or password' },
             status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User updated successfully'
      redirect_to users_path
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to edit_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'User deleted successfully'
    redirect_to users_path
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
