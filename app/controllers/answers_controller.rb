class AnswersController < ApplicationController
  def index
    @contact = Contact.find(params[:contact_id])
    @questions = Question.where(contact_id: @contact)
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @likes = Like.where(contact: @contact).sample
    @score = 0
    @question = Question.find_by(question: "Does #{@contact.first_name} likes #{@likes.tag.name}?")
    @answer = Answer.new(question: @question)

  end

  def create
    @contact = Contact.find(params[:contact_id])
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    if @answer.save!
      if @answer.answer == @answer.question.correct_answer
        @score = 100
        @message = "Congrats, right answer"
      else
        @score = 0
        @message = "Ops, wrong answer"
      end
      @answer.question.score = @score
      @answer.question.save!
      redirect_to new_contact_answer_path(@contact), notice: @message
    else
    end
  end

end

def answer_params
  params.require(:answer).permit(:question_id, :contact_id, :answer)
end
