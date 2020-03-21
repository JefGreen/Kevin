class GroupContactsController < ApplicationController
  def new
    @group = Group.new
    @contact = Contact.find(params[:contact_id])
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @group = Group.find_or_create_by(name: params[:group_contact][:group].titlecase)
    group_contact_existed = GroupContact.find_by(contact_id: params[:contact_id], group_id: @group.id)

    if group_contact_existed
      # liked_before.update(likes_params)
      # group_n_for_q = [Group.all.sample.name, @group.name].sample
      q_exists = Question.find_by(type: "GroupContact", contact_id: @contact.id)
      q_exists.update(correct_answer: @group.name)
      redirect_to contact_path(@contact)

    else
      @contact_group = GroupContact.new(group_contacts_params)
      @contact_group.group_id = @group.id
      @contact_group.contact_id = params[:contact_id]
      Question.create(
        question: "Is #{@contact.first_name} #{@contact.last_name} part of the group called #{@group.name}?",
        correct_answer: params[:group_contact][:group],
        contact: @contact,
        question_type: "GroupContact"
      )
      if @liked.save
        redirect_to contact_path(@contact)
      else
        render :new
      end
    end
  end

  def destroy
    @liked = Like.find(params[:id])
    @liked.destroy
    redirect_to contact_path(@contact)
  end

  private

  def group_contacts_params
    params.require(:like).permit(%i[contact_id group_id])
  end
end
