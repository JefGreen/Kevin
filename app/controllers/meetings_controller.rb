class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to
    else
      render :new
    end

  end

  def edit
    @meeting.save
  end

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :location)
  end


end
