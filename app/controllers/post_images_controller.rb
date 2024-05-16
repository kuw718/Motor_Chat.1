class PostImagesController < ApplicationController

  def new
    ActiveRecord::Base.connection.execute("Motor_Chat")
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.customer_id = current_customer.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to '/post_images'
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :caption)
  end

end
