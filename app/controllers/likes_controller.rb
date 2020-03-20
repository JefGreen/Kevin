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
      liked_before.update(likes_params)
      question_exists = Question.find_by(question: "Does #{@contact.first_name} likes #{@tag.name}?")
      question_exists.update(correct_answer: params[:like][:liked].to_s)
      redirect_to contact_path(@contact)

    else
      @liked = Like.new(likes_params)
      @liked.tag_id = @tag.id
      @liked.contact_id = params[:contact_id]
      @question = Question.create(
        question: "Does #{@contact.first_name} likes #{@tag.name}?",
        correct_answer: params[:like][:liked].to_s,
        contact: @contact
      )
      if @liked.save
        redirect_to contact_path(@contact)
      else
        render :new
      end
    end
  end

  def destroy
    @liked = Like.find(params[:id])
    @liked.destroy
    @contact = Contact.find(params[:contact_id])
    redirect_to contact_path(@contact)
  end

  private

  def likes_params
    params.require(:like).permit(%i[contact_id tag_id liked])
  end
end
