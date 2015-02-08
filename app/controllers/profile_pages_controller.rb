class ProfilePagesController < ApplicationController

  def show
    @user = current_user

    if Network.where(user_id: @user.id)
      @networks = Network.where(user_id: @user.id)
    else
      @network = Network.new(user_id: @user.id)
      @user.network_id = @network.id
      @user.save
      @network.save
    end
    @messages = Message.all
    #@messages = Message.where(network_id: @user.id)
    @message = Message.new
  end

  def newsfeed
    @user = current_user
    @message = Message.new(message_params)
    @message.user_id = @user.id

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
