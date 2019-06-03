class UsersController < ApplicationController
before_action :authorize_request, except: :create

  def new
    @user = User.new
    render json: @user, status: :ok
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      token = JsonWebToken.encode(user_id: @user.id, username: @user.username)
      render json: { token: token }, status: :ok
    else
  		render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
    end
  end
# :authorize_request will set @current_user so for :index ,:show, etc.. to show user info you need to reference @current_user
private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
