class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def welcome
    # Get first meeting or notify user that they have no meetings
    mettings = Meeting.all
    if mettings.count.zero?
      @phrase = "You currently have no meetings coming up"
      @meeting_percentage = 100
    else
      meeting = mettings.order('start_time ASC').first
      @phrase = "You have a new meeting starting at #{meeting.start_time&.strftime('%I:%M%p')}"

      meeting_q = meeting.questions
      @meeting_percentage = meeting_q.count.zero? ? 100 : meeting_q.where(score: 100).count * 100 / meeting_q.count
    end

    # Get percentage for the total of contacts
    @percentage = Question.count.zero? ? 100 : Question.where(score: 100).count * 100 / Question.count

    # Color setup
    if @percentage.zero?
      @color = "red"
    elsif @percentage == 100
      @color = "green"
    elsif @percentage < 40
      @color = "orange"
    end
  end
end
