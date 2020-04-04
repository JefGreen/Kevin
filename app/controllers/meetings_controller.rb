class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
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
    @meetings = Meeting.all.order("start_time ASC")
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

    @final_percentage = Contact.percentage_of(@meeting.contacts)
    @color = color(@final_percentage)
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
