class ExperiencesController < ApplicationController
  def create
    @experience = Experience.new(experience_params)
    @user = current_user
    @experience.user_id = @user.id
    if @experience.save
      respond_to do |format|
        format.html { redirect_to profile_page_profile_path(@user), notice: "Experience Updated"}
        format.json { render :show }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json
      end
    end
  end


  def experience_params
    params.require(:experience).permit(:title, :company_name, :date, :description, :user_id)
  end
end
