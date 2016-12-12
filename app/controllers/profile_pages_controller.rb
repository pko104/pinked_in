class ProfilePagesController < ApplicationController

  def index
    if current_user
      redirect_to profile_page_path(current_user)
    end
  end

  def update
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @message = Message.new
  end

  def profile
    @current_user = current_user
    @new_summary = Summary.new
    @new_education = Education.new
    @new_project = Project.new
    @new_experience = Experience.new
    @new_skill = Skill.new
    @new_language = Language.new
    @new_volunteer = Volunteering.new
    @user = User.find(params[:profile_page_id])
    @summary = Summary.find_by(user_id: params[:profile_page_id])
    @educations = Education.where(user_id: params[:profile_page_id])
    @experiences = Experience.where(user_id: params[:profile_page_id])
    @projects = Project.where(user_id: params[:profile_page_id])
    @languages = Language.where(user_id: params[:profile_page_id])
    @skills = Skill.where(user_id: params[:profile_page_id])
    @volunteering = Volunteering.where(user_id: params[:profile_page_id])
  end

  def newsfeed
    # binding.pry

    @current_user = current_user
    @message = Message.new(message_params)

    if @current_user.network_id == nil{
      @current_user.network_id == @current_user.id
    }
    @message.network_id = @current_user.network_id
    @message.user_id = @current_user.id

    if @message.save
      render :json => @message.to_json
    else
      render :json => [{ :error => "An error was encountered while processing your photos. Please try again." }], :status => 304
    end
  end

  def live_notifications
    @user = User.find(params[:id])
    @current_user = current_user

    # if @current_user != @user
    #   redirect_to profile_page_profile_path(@user)
    # end

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
          @friends = network.connected_ids_array.split(',')
            @friends.each do |friend|
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

    respond_to do |format|
      format.js
      format.html
    end
  end

  def pink_in

    @current_user = current_user
    @mynetwork = Network.find_by(user_id: @current_user)

    @user = User.find(params[:id])

    @network = Network.find_by(user_id: @user)

    #intiates network
    if @network.connected_ids_array == nil
      @network.connected_ids_array = ""
    end

    if @mynetwork.connected_ids_array == nil
      @mynetwork.connected_ids_array = ""
    end

    #appends userid with a comma to network
    @network.connected_ids_array << "#{@current_user.id},"

    if @network.save
      @mynetwork.connected_ids_array << "#{@user.id},"
      @mynetwork.save
      redirect_to profile_page_path(@current_user)
    end
  end

  private

  def message_params
    params.require(:message).permit(:description,:html)

  end


end
