class ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    @user = current_user
    @project.user_id = @user.id
    if @project.save
      redirect_to profile_page_profile_path(@user), notice: "Project Updated"
    else
      flash.now[:notice]= @project.errors.full_messages
      render :new
    end
  end
  

  def update
  end

  def project_params
    params.require(:project).permit(:title, :description, :user_id)
  end
end
