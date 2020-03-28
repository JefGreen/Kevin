class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def welcome
    @sum = 0

    @questions = Question.all
      if @questions.count.zero?
        @percentage = 0
      else
        @percentage = @questions.where(score: 100).count * 100 / @questions.count
      end
  end
end
