# encoding: utf-8

class ProfileController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def show
  end

  def edit
    redirect_to root_path, alert: "Yetkisiz erişim!" unless is_permitted?
  end

  def update
    redirect_to root_path, alert: "Yetkisiz erişim!" and return false unless is_permitted?
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profiliniz başarıyla güncellendi!"
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:profile_name, :phone_number, :city, :town, :address, :avatar)
  end

  def is_permitted?
    current_user == @profile.user
  end
end