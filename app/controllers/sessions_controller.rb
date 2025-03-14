class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && BCrypt::Password.new(@user["password"]) == params["password"]
      session[:user_id] = @user.id
      redirect_to places_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end