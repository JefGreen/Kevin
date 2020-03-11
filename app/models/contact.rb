class Contact < ApplicationRecord
  def show
    @contact = Contact.find(params[:id])
    @image = User.all.first.photo.key
  end

  def new
    @review = Review.new
    @mentor = User.find(params[:user_id])
  end

  def create
    @review = Review.new(review_params)
    @mentor = User.find(params[:user_id])
    @review.mentor = @mentor
    @review.mentee = current_user
    if @review.save
      redirect_to user_path(@mentor)
    else
      render :new
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.save
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to user_meetings_path(current_user)
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.accepted = true
    @meeting.save
    redirect_to user_meetings_path(current_user)
  end

  private

  def contact_params
    params.require(:user).permit(:name, :description, :linkedin_account, :github_account, :photo)
  end
end
