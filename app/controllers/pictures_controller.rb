class PicturesController < ApplicationController
  before_action :set_all_pictures, only:[:index, :create, :confirm]
  before_action :set_picture, only:[:show, :edit, :update, :destroy]

  def index
    @picture = current_user.pictures.new
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    if params[:back]
      render :index
    else
      if @picture.save
        redirect_to pictures_path, notice:"新規投稿しました"
      else
        render :index
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice:"投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
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
  def set_all_pictures
    @pictures = Picture.all.order("created_at DESC")
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
