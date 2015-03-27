class SummariesController < ApplicationController
  def create
    @summary = Summary.new(summary_params)
    @user = current_user
    @summary.user_id = @user.id
    if @summary.save
      respond_to do |format|
        format.html { redirect_to profile_page_profile_path(@user), notice: "Summary Updated"}
        format.json { render :show }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json
      end
    end
  end

  def update
  end

  def summary_params
    params.require(:summary).permit(:description, :user_id)
  end
end
