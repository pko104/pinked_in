class SummariesController < ApplicationController
  def create
    @summary = Summary.new(summary_params)
    @user = current_user
    @summary.user_id = @user.id
    if @summary.save
      redirect_to profile_page_profile_path(@user), notice: "Summary Updated"
    else
      flash.now[:notice]= @summary.errors.full_messages
      render :new
    end
  end

  def update
  end


  def summary_params
    params.require(:summary).permit(:description, :user_id)
  end
end
