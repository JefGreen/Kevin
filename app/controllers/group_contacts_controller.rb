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
      liked_before.update(likes_params)
      full_name = @contact.first_name @contact.last_name
      group_n_for_q = [Group.all.sample.name, @group.name].sample
      q_exists = Question.find_by(question: "Is #{full_name} part of the group called #{@group.name}?")
      q_exists.update(correct_answer: @group.name)
      redirect_to contact_path(@contact)

    else
      @liked = GroupContact.new(likes_params)
      @liked.tag_id = @tag.id
      @liked.contact_id = params[:contact_id]
      question = Question.create(
        question: "Does #{@contact.first_name} likes #{@tag.name}?",
        correct_answer: params[:like][:liked].to_s,
        contact: @contact
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

  def likes_params
    params.require(:like).permit(%i[contact_id group_id])
  end
end
