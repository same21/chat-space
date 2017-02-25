class MessagesController < ApplicationController

  before_action :set_action, only:[:index,:create]
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

    def set_action
      @message = Message.new
      @group = Group.find(params[:group_id])
      @groups = current_user.groups
    end
end
