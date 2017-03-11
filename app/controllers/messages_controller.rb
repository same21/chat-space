class MessagesController < ApplicationController

  before_action :set_group, :set_group_users, :set_group_messages, :set_current_groups, :set_message

  def index
  end

  def create
    message = Message.new(create_params)
    if message.save
      new_message = message.convert_into_json
      respond_to do |format|
      format.html { render :index}
      format.json { render json: new_message}
      end
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
      render :index
    end
  end

  private

    def create_params
     params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_group_users
      set_group
      @group_users = @group.users
    end

    def set_group_messages
      set_group
      @group_messages = @group.messages
    end

    def set_current_groups
      @groups = current_user.groups
    end

    def set_message
      @message = Message.new
    end

end
