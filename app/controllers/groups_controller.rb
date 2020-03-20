class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    if @group.save
    else
      render :new
    end
  end
end
