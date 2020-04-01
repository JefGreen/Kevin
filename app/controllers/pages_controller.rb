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

    if @percentage == 0
      @color = "red"
    elsif @percentage == 100
      @color = "green"
    elsif @percentage < 40
      @color = "orange"
    end

  end
end
