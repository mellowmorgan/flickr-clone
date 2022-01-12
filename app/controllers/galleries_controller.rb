class GalleriesController < ApplicationController
  include Devise::Controllers::Helpers 
  def index
    @user=User.find(params[:user_id])
    render :index
  end
  def show
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:id])
    render :show
  end
  def new
    @user=User.find(params[:user_id])
    if current_user != @user
      flash[:alert] = "You are not authorized to access this page." 
      redirect_to root_path
    else
      @gallery = @user.galleries.new
      render :new
    end
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
  def delete_image_attachment
    @gallery= Gallery.find(params[:id])
    @image = @gallery.image
    if current_user != @user
      flash[:notice] = "You are not authorized to delete this image."
      redirect_to user_gallery_path
    else
      @image.purge
      flash[:notice] = "Image successfully deleted."
      redirect_to user_gallery_path
    end
  end
  def edit
    @user= User.find(params[:user_id])
    @gallery = Gallery.find(params[:id])
    if current_user != @user
      flash[:alert] = "You are not authorized to access this page."
      redirect_to user_gallery_path
    else
      render :edit
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    gallery=params[:gallery]
    @user = User.find(params[:user_id])
    if @gallery.update(name:gallery[:name])
      @gallery.image.attach(gallery[:image])
      flash[:notice] = "Gallery successfully updated!"
      redirect_to user_gallery_path
    else
      flash[:alert] = "There was an error in updating your Gallery!"
      render :edit
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @user = User.find(params[:user_id])
    if current_user != @user
      flash[:alert] = "You are not authorized to delete this gallery." 
      redirect_to user_gallery_path(@user, @gallery)
    else
      @gallery.destroy
      redirect_to user_galleries_path(@user)
    end
  end
  # private
  # def gallery_params
  #   params.require(:gallery).permit(:name, :image)
  # end
end