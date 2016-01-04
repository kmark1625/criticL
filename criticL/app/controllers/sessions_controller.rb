class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to @user
    else
      flash[:danger] "Login information not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id].destroy
    render "root"
  end
end