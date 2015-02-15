class ProfilePagesController < ApplicationController

  def index
    if current_user
      redirect_to profile_page_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    if @current_user.network_id == nil
      @network = Network.new(user_id: @current_user.id)
      @network.connected_ids_array = ""
      @network.save
      @current_user.network_id = @network.id
      @current_user.save
      @messages = Message.where(user_id: @user)
    else
      @newsfeed = []
      @networks = Network.where(user_id: @user)
      if @networks.length >= 1 && @networks != nil
        @networks.each do |network|
          network.messages.each do |nw|
            @newsfeed << nw
          end
          if network.connected_ids_array != nil && network.connected_ids_array.length >= 1
          friends = network.connected_ids_array.split(',')
            friends.each do |friend|
              @friend_network = Network.where(user_id: friend)
              if @friend_network.length >= 1 && @friend_network != nil
                @friend_network.each do |f|
                  f.messages.each do |p|
                    @newsfeed << p
                  end
                end
              end
            end
          end
        end
      end
    end

    @messages = Message.where(user_id: @user)

    if @newsfeed
    @newsfeed = @newsfeed.sort_by{ |k| k["created_at"]}.reverse
    end
    #binding.pry
    @message = Message.new
  end

  def newsfeed
    @current_user = current_user
    @message = Message.new(message_params)
    @message.network_id = @current_user.network_id
    @message.user_id = @current_user.id

    if @message.save
      respond_to do |format|
        format.html { redirect_to profile_page_path(@current_user), notice: "Message Posted!" }
        format.json { render :show }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json
      end
    end
  end

  def pink_in
    @current_user = current_user
    @user = User.find(params[:profile_page_id])
    @network = Network.find_by(user_id: @user)
    @mynetwork = Network.find_by(user_id: @current_user)

    if @network.connected_ids_array == nil
      @network.connected_ids_array = ""
    end

    @network.connected_ids_array << "#{@current_user.id},"

    if @network.save
      @mynetwork.connected_ids_array = ""
      @mynetwork.connected_ids_array << "#{@user.id},"
      @mynetwork.save
      redirect_to profile_page_path(@current_user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:description)
  end


end
