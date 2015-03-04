class SkillsController < ApplicationController
  def create
    @skill = Skill.new(skill_params)
    @user = current_user
    @skill.user_id = @user.id
    if @skill.save
      redirect_to profile_page_profile_path(@user), notice: "skill Updated"
    else
      flash.now[:notice]= @skill.errors.full_messages
      render :new
    end
  end


  def skill_params
    params.require(:skill).permit(:name_of_skill, :user_id)
  end
end
