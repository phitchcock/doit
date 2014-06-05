class UsersController < ApplicationController

  def show
    @user = current_user
    @lists = @user.lists
  end

  # def invite_user
  #   @user = User.invite!(:email => params[:user][:email])
  #   render :json => @user
  # end

end