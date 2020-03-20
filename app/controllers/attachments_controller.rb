class AttachmentsController < ApplicationController
  def new
    @attachment = Attachment.new

  end

  def create
    @attachment = Attachment.new
    if @attachment.save
      redirect_to stories_path
    else
      render :new
    end
  end
end
