class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      remember(user)
      redirect_to root_url
    else
      flash.now[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end
end
