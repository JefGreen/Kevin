class AnswersController < ApplicationController
  def new
    @contact = Contact.find(params[:contact_id])
    @likes = Like.where(contact: @contact).sample
    @score = 0

    @question = Question.create(
      question: "Does #{@contact.first_name} likes #{@likes.tag.name}?",
      correct_answer: @likes.liked,
      contact: @contact
    )

    @answer = Answer.new(question: @question)

  end

  def create
    @contact = Contact.find(params[:contact_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    if @answer.save!
      if @answer.answer == @answer.question.correct_answer
        @score = 100
      else
        @score = 0
      end
      @answer.question.score = @score
      @answer.question.save!
    else
      redirect_to new_contact_answer_path(@contact)
    end
  end

end

def answer_params
  params.require(:answer).permit(:question_id, :contact_id, :answer)
end
