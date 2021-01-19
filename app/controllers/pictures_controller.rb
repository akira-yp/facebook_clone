class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @picture = current_user.pictures.new
  end

  def create
    if params[:back]
      render :index
    else
      @picture = current_user.pictures.new(picture_params)
      if @picture.save
        redirect_to pictures_path, notice:"新規投稿しました"
      else
        @pictures = Picture.all
        render :index
      end
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
  def confirm
    @picture = current_user.pictures.new(picture_params)
    render :index if @picture.invalid?
  end
  private
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end
end
