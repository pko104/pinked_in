class LanguagesController < ApplicationController
  def create
    @language = Language.new(language_params)
    @user = current_user
    @language.user_id = @user.id
    if @language.save
      redirect_to profile_page_profile_path(@user), notice: "language Updated"
    else
      flash.now[:notice]= @language.errors.full_messages
      render :new
    end
  end

  def language_params
    params.require(:language).permit(:name, :proficiency, :user_id)
  end
end
