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
    @percentage_color = color(@percentage)
    @meeting_percentage_color = color(@meeting_percentage_color)
  end

  private

  def color(value)
    case value.to_i
    when 'NA'
      "red"
    when 0...10
      "red"
    when 10...40
      "orange"
    when 40...100
      "yellow"
    when 100
      "green"
    end
  end
end
