class GroupsController < ApplicationController

before_action :set_group, only: [:edit,:update]

def set_group
  @group = Group.find(params[:id])
end


def new
  @group = Group.new
end

def create
  @group = Group.new(group_params)
  if @group.save
    redirect_to root_path,notice: "チャットグループが作成されました。"
  else
    flash[:alert] = "チャットグループの作成に失敗しました。"
    render :new
  end
end

def edit
end

def update
  if @group.user_ids == current_user.id
  @group.update(group_params)
  end
  if @group.update(group_params)
    redirect_to root_path,notice: "チャットグループが編集されました。"
  else
    flash[:alert] = "チャットグループの編集に失敗しました。"
    render :new
  end
end


private
  def group_params
    params.require(:group).permit(:name,{user_ids:[]})
  end

end
