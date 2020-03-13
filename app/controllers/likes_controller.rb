class LikesController < ApplicationController
  def new
    @liked = Like.new
    @contact = Contact.find(params[:contact_id])

  end

  def create
    @contact = Contact.find(params[:contact_id])
    @tag = Tag.find_or_create_by(name: params[:like][:tag])
    liked_before = Like.find_by(contact_id: params[:contact_id], tag_id: @tag.id)
    @liked = liked_before ? liked_before : Like.new(
      contact: @contact,
      tag: @tag,
      liked: params[:like][:liked]
    )
    if @liked.save
      redirect_to new_contact_like_path
    else
      render :new
    end
  end

  private

  def likes_params
    params.require(:like).permit(:contact, :tag, :liked)
  end
end
