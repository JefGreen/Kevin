class MemoriesController < ApplicationController
  before_action :find_story

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.new(memory_params)
    @memory.story_id = @story.id
    if @memory.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  private

  def find_story
    @story = Story.find(params[:story_id])
  end

  def memory_params
    params.require(:memory).permit(:contact_id, :story_id)
  end
end
