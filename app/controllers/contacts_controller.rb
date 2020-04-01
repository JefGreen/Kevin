class ContactsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    if params["search"]
      @contacts = Contact.all.search_by_name_and_groups(params["search"].to_s).order('first_name ASC')
    else
      @contacts = Contact.all.order('first_name ASC')
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @liked = Like.new
    @contact = Contact.find(params[:id])
    @questions = @contact.questions
    if @questions.count.zero?
      @percentage = 0
    else
      @percentage = @questions.where(score: 100).count * 100 / @questions.count
    end

    if @percentage == 0
      @color = "red"
    elsif @percentage == 100
      @color = "green"
    elsif @percentage < 40
      @color = "orange"
    end

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @contact.save
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to contact_path(@contact)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :meeting_location, :birthday, :photo)
  end
end
