class LikesController < ApplicationController
  def new
    @liked = Like.new
  end

  def create
    liked_before = Like.find_by(contact: 'Jeff', tag: 'Rock')
    @liked = liked_before ? liked_before : Like.new(likes_params)
    if @liked.save
      redirect_to contact_path(@liked)
    else
      render :new
    end
  end

  private

  def likes_params
    params.require(:like).permit(:contact, :tag, :liked)
  end
end
