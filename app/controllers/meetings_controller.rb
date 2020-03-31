class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    p meeting_params
    p @meeting
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.save
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    redirect_to meeting_path(@meeting)
  end


  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])

    @meetings = Meeting.geocoded

    @markers = [@meeting].map do |meeting|
      {
        lat: meeting.latitude,
        lng: meeting.longitude
      }
    end

    @sum = 0
    @meeting.contacts.each do |contact|
      @questions = contact.questions
      if @questions.count.zero?
        @percentage = 0
      else
        @percentage = @questions.where(score: 100).count * 100 / @questions.count
      end
      @sum = @percentage + @sum
    end
    @final_percentage = @meeting.contacts.count.zero? ? 0 : @sum / @meeting.contacts.count
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :location, :title)
  end

end
