class EventsController < ApplicationController
  before_action :find_meeting

  def new
    @event = Event.new
    @contacts = Contact.all.order('first_name ASC')
  end

  def create
    @event = Event.new(event_params)
    @event.meeting_id = @meeting.id
    if @event.save
      redirect_to meeting_path(@meeting)
    else
      render :new
    end
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def event_params
    params.require(:event).permit(:contact_id, :meeting_id)
  end


end

