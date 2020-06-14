class UsersController < ApplicationController
  before_action :authorize, only: [:auto_login, :show]

  # SIGNUP
  def create
    @user = User.new(user_params)
    if @user.save
      jwt_token = encode_token({user_id: @user.id})
      render json: { token: jwt_token }, status: 200
    else
      render json: { error: @user.errors.full_messages[0] }, status: 400
    end
  end

  # LOGIN
  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      jwt_token = encode_token({user_id: @user.id})
      render json: { events: @user.events, token: jwt_token }, status: 200
    else
      render json: { error: "Check email and password are correct." }, status: 400
    end
  end

  # SHOW
  def show
    @user = logged_in_user
    if @user
      render json: { user: @user }, status: 200
    else
      render json: { error: "Error" }, status: 400
    end
  end

  # UPDATE
  def update
    @user = logged_in_user
    @user.update(user_params)
    if @user.save
      render json: { message: "Success" }, status: :ok
    else
      render json: { error: @user.errors.full_messages[0] }, status: 400
    end
  end

  # DESTROY
  def destroy
    @user = logged_in_user
    if @user && @event
      @user.events.delete(@event)
      render json: { message: "Success" }, status: :ok
    else
      render json: { error: "Error" }, status: 400
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :auth).
    delete_if {|key, value| value.blank? }
  end

end
