class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    flash.discard(:success)
  end

  def profile
    @user = current_user
  end

  def edit
    if current_user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to :action => "profile"
    end
  end

  private
    def user_params
      params.require(:patch).permit(:name, :birthday, :sex, :school)
    end
    def authenticate_user!
      if !user_signed_in?
        redirect_to '/users/sign_in'
      end
    end
end
