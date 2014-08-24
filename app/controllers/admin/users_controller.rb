# encoding: utf-8

class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :ensure_admin

  def index
    @users = User.paginate(page: params[:page], per_page: 15).order(first_name: :asc)
  end

  def edit
  end

  def update
    redirect_to admin_users_path, notice: 'Kullanıcı başarıyla güncellendi!' if @user.update(user_params)
  end

  def destroy
    redirect_to admin_users_path, alert: 'Kullanıcı başarıyla silindi!' if @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :admin)
  end

  def ensure_admin
    redirect_to :root, :alert => "Yetkisiz erişim sağlamaya çalışıyorsunuz!" unless current_user.is_admin?
  end
end