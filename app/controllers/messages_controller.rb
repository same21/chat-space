class MessagesController < ApplicationController

  before_action :set_group, :set_current_groups, :set_message, only: %i(index create)

  def index
  end

  def create
    new_message = Message.new(create_params)
    if new_message.save
      flash.now[:notice] = "メッセージを送信しました。"
      render :index
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

    def set_current_groups
      @groups = current_user.groups
    end

    def set_message
      @message = Message.new
    end

end
