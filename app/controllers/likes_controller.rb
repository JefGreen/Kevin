class LikesController < ApplicationController
  before_action :find_contact

  def new
    @liked = Like.new(liked: true)
    @false = @liked.liked = false
    @true = @liked.liked = true
  end

  def create
    @tag = Tag.find_or_create_by(name: params[:like][:tag].titlecase)
    liked_before = Like.find_by(contact_id: params[:contact_id], tag_id: @tag.id)

    if liked_before
      liked_before.update(likes_params)
      full_name = @contact.first_name @contact.last_name
      question_exists = Question.find_by(question: "Does #{full_name} like #{@tag.name}?")
      question_exists.update(correct_answer: params[:like][:liked].to_s)
      redirect_to contact_path(@contact)

    else
      @liked = Like.new(likes_params)
      @liked.tag_id = @tag.id
      @liked.contact_id = params[:contact_id]
      @question = Question.create(
        question: "Does #{@contact.first_name} like #{@tag.name}?",
        correct_answer: params[:like][:liked].to_s,
        contact: @contact,
        question_type: "Like"
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
    question = Question.find_by(question: "Does #{@contact.first_name} #{@contact.last_name} like #{@liked.tag.name}?")
    question.destroy
    @liked.destroy
    redirect_to contact_path(@contact)
  end

  private

  def find_contact
    @contact = Contact.find(params[:contact_id])
  end

  def likes_params
    params.require(:like).permit(%i[contact_id tag_id liked])
  end
end
