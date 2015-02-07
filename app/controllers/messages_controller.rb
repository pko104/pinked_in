class MessagesController < ApplicationController

  def create
    @user = current_user
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      respond_to do |format|
        format.html { redirect_to profile_page_path(@user), notice: "Message Posted!" }
        format.json { render :show }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:description)
  end

end
