class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new
    if @tag.save
    else
      render :new
    end
  end
end
