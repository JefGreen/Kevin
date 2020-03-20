class MemoriesController < ApplicationController
  def new
    @memory = Memory.new
    @story = Story.find(params[:story_id])
  end

  def create
    @story = Story.find(params[:story_id])
    @memory = Memory.new(memory_params)
    @memory.story_id = @story.id
    if @memory.save
    redirect_to story_path(@story)
    else
      render :new
    end
  end

  private

  def memory_params
    params.require(:memory).permit(:contact_id, :story_id)
  end
end
