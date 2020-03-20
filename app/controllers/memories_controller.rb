class MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def create
    @story = Story.find(params[:story_id])
    @memory = Memory.new(memory_params)
    @memory.story_id = @story.id
    if @memory.save

    else
      render :new
    end
  end

  private

  def memory_params
    params.require(:memory).permit(:contact_id, :story_id)
  end
end
