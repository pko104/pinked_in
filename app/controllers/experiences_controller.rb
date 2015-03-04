class ExperiencesController < ApplicationController
  def create
    @experience = Experience.new(experience_params)
    @user = current_user
    @experience.user_id = @user.id
    if @experience.save
      redirect_to profile_page_profile_path(@user), notice: "Summary Updated"
    else
      flash.now[:notice]= @experience.errors.full_messages
      render :new
    end
  end


  def experience_params
    params.require(:experience).permit(:title, :company_name, :date, :description, :user_id)
  end
end
