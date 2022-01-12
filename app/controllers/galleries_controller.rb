class GalleriesController < ApplicationController
  def index
    @user=User.find(params[:user_id])
    render :index
  end
  def show
    @gallery = Gallery.find(params[:id])
    render :show
  end
  def new
    @user=User.find(params[:user_id])
    @gallery = @user.galleries.new
    render :new
  end
  def create
    @user=User.find(params[:user_id])
    gallery=params[:gallery]
    @gallery = @user.galleries.new({name:gallery[:name]})
    if @gallery.save
      @gallery.image.attach(gallery[:image])
      flash[:notice] = "Gallery successfully added!"
      redirect_to user_galleries_path(@user)
    else
      flash[:alert] = "There was an error in creating your gallery!"
      render :new
    end
  end
  # private
  # def gallery_params
  #   params.require(:gallery).permit(:name, :image)
  # end
end