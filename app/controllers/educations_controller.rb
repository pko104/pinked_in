class EducationsController < ApplicationController
  def create
    @education = Education.new(education_params)
    @user = current_user
    @education.user_id = @user.id
    if @education.save
      redirect_to profile_page_profile_path(@user), notice: "education Updated"
    else
      flash.now[:notice]= @education.errors.full_messages
      render :new
    end
  end

  def education_params
    params.require(:education).permit(:school, :degree, :date, :user_id)
  end
end
