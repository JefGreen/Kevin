class StoriesController < ApplicationController
  before_action :find_story, only: %i[show edit destroy update]

  def new
    @story = Story.new
    @user = current_user
    @attachment = Attachment.new
  end

  def create
    @story = Story.new(story_params)
    @attachment = Attachment.new
    @user = current_user
    @story.user = @user
    @story.attachment = @attachment
    if @story.save
      redirect_to stories_path
    else
      render :new
    end
  end

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
    @memories = Memory.where(story_id: @story.id)
  end

  def edit
    @story.save
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  def update
    @story.update(story_params)
    redirect_to story_path(@story)
  end

  private

  def find_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:description, :title, :attachment_id, :user_id, :date)
  end
end
