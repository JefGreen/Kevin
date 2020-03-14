class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new


    if @question.save
    else
      render :new
    end
  end
end
