class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def mypage
    @user = User.find(current_user.id)
  end
  
  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to "/"
  end
end