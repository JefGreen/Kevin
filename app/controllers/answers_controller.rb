class AnswersController < ApplicationController
  before_action :find_contact, only: [:index, :new, :create]

  def index
    @questions = @contact.questions
  end

  def new
    @score = 0
    @question = @contact.questions.sample
    @answer = Answer.new(question: @question)
    @questions = @contact.questions
    if @questions.count.zero?
      @percentage = 0
    else
      @percentage = @questions.where(score: 100).count * 100 / @questions.count
    end
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    if @answer.save!
      if @answer.answer == @answer.question.correct_answer
        @score = 100
        @message = {
                    text: "Congrats, you got it right",
                    color: "#4caf50"
                  }
      else
        @score = 0
        @message = {
                    text: "Sorry, wrong answer!",
                    color: "#f44336"
                  }
      end
      @answer.question.score = @score
      @answer.question.save!
      redirect_to new_contact_answer_path(@contact), notification: @message
    else
      render :new
    end
  end
end

private

def find_contact
  @contact = Contact.find(params[:contact_id])
end

def answer_params
  params.require(:answer).permit(:question_id, :contact_id, :answer)
end
