class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def welcome
    # Get first meeting. Notify user that they have no meetings and give a percentage
    mettings = Meeting.all
    if mettings.count.zero?
      @phrase = "You currently have no meetings coming up"
      @meeting_percentage = 0
    else
      meeting = mettings.order('start_time ASC').first
      @meeting_percentage = Contact.percentage_of(meeting.contacts)
      start_date = meeting.start_time&.strftime("%B %e ")
      start_time = meeting.start_time&.strftime('%I:%M%p')
      @phrase = "You have a new meeting #{start_date} at #{start_time} and #{phrase_for(@meeting_percentage)[0]}"
      @phrase2 = phrase_for(@meeting_percentage)[1]
    end
  end

  private

  def phrase_for(percentage)
    case percentage.to_i
    when 0...50
      ["you only know ", "Use this time to learn to know them."]
    when 50...70
      ["you know ", "Practice more if you have time."]
    when 70...100
      ["wow you know ", "You are ready!."]
    end
  end
end
