class ContactsController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @contacts = Contact.all.order('first_name ASC')
  end

  def show
    @contact = Contact.find(params[:id])
    @questions = Question.where(contact_id: @contact)
    if @questions != nil
      @percentage = (@questions.where(score: 100).count)*100 / @questions.count
    else
      @percentage = 0
    end
    # @image = Contact.all.first.photo.key
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
