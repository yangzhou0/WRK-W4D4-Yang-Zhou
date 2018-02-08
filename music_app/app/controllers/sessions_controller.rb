class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email],user_params[:password])
    if user
      login(user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Wrong password or email"]
      render :new
    end
  end
  
  def destroy
    logout
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  
end