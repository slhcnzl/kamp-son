# encoding: utf-8

class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

    def show
    end

    def edit
    end

    def update
      if @category.update(category_params)
        redirect_to @category, notice: "Kategori başarıyla güncellendi!"
      else
        render :edit
      end
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to @category, notice: "Kategori başarıyla oluşturuldu!"
      else
        render :new
      end
    end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end