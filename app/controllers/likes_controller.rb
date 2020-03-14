class LikesController < ApplicationController
  def new
    @liked = Like.new
    @contact = Contact.find(params[:contact_id])
    @false = @liked.liked = false
    @true = @liked.liked = true
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @tag = Tag.find_or_create_by(name: params[:like][:tag].titlecase)
    liked_before = Like.find_by(contact_id: params[:contact_id], tag_id: @tag.id)

    if liked_before
      # liked_before.update(
      #   contact_id: params[:contact_id],
      #   tag_id: @tag.id,
      #   liked: params[:like][:liked]
      # )
      liked_before.update(likes_params)
      redirect_to contact_path(@contact)
    else
      @liked = Like.new(likes_params)
      @liked.tag_id = @tag.id
      @liked.contact_id = params[:contact_id]
      if @liked.save
        redirect_to contact_path(@contact)
      else
        render :new
      end
    end
  end

  private

  def likes_params
    params.require(:like).permit(%i[contact_id tag_id liked])
  end
end
