class LikesController < ApplicationController
  def new
    @liked = Like.new
    @contact = Contact.find(params[:contact_id])
    @false = @liked.liked = false
    @true = @liked.liked = true
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @tag = Tag.find_or_create_by(name: params[:like][:tag])
    liked_before = Like.find_by(contact_id: params[:contact_id], tag_id: @tag.id)

    if liked_before
      liked_before.update(
        contact_id: params[:contact_id],
        tag_id: @tag.id,
        liked: params[:like][:liked]
      )
    else
      @liked = Like.new(
        contact: @contact,
        tag: @tag,
        liked: params[:like][:liked]
      )
      if !@liked.save
        render :new
      end
    end
    redirect_to contact_path(@contact)
  end

  private

  def likes_params
    params.require(:like).permit(:contact, :tag, :liked)
  end
end
