class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def welcome

    # meeting percentage

    @meeting = Meeting.all.order('start_time ASC').first

    @sum_meeting = 0
    @meeting.contacts.each do |contact|
      @questions_contacts = contact.questions
      if @questions_contacts.count.zero?
        @percentage1 = 0
      else
        @percentage1 = @questions_contacts.where(score: 100).count * 100 / @questions_contacts.count
      end
      @sum_meeting = @percentage1 + @sum_meeting
    end
    @meeting_percentage = @meeting.contacts.count.zero? ? 0 : @sum_meeting / @meeting.contacts.count

    # general percentage

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
