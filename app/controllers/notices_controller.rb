# encoding: utf-8

class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @notices = Notice.all
  end


  def show
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.user = current_user
    if @notice.save
      redirect_to @notice, notice: 'İlan başarıyla oluşturuldu!'
    else
      render :new
    end
  end

  def edit
    redirect_to root_path, alert: "Yetkisiz erişim!" unless is_permitted?
  end

  def update
    redirect_to root_path, alert: "Yetkisiz erişim!" and return false unless is_permitted?
    if @notice.update(notice_params)
      redirect_to @notice, notice: 'İlan başarıyla güncellendi!'
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, alert: "Yetkisiz Erişim!" and return false unless is_permitted?
    @notice.destroy
    redirect_to notices_url, notice: 'İlan başarıyla silindi!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    def is_permitted?
      current_user == @notice.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_params
      params.require(:notice).permit(:title, :message)
    end
end