class PicturesController < ApplicationController
  def index
    @picture = Picture.new
    @pictures = Picture.all
  end
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :index
    end
  end
  def show
    @picture = Picture.find(params[:id])
  end
  def edit
    @picture = Picture.find(params[:id])
  end
  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice:"投稿を更新しました"
    else
      render :edit
    end
  end
  def destroy
    @picture = Picture.find(params[:id])
    @picture.delete
    redirect_to pictures_path, notice:"投稿を削除しました"
  end
  private
  def picture_params
    params.require(:pictures).permit(:image, :image_cache,:content)
  end
end
