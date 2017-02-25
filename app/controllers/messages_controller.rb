class MessagesController < ApplicationController

  def set_action
    @message = Message.new
    @group = Group.find(params[:group_id])
  end

  def index
    set_action
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      set_action
      flash.now[:notice] = "メッセージを送信しました。"
      render :index
    else
      set_action
      flash.now[:alert] = "メッセージ送信に失敗しました。"
      render :index
    end
  end

  private
    def create_params
     params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
    end
end
