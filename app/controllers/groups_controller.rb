class GroupsController < ApplicationController

def new
  @group = Group.new
end

def create
  @group = Group.create(group_params)
  if @group.save
    redirect_to controller: :users, action: :index,notice: "チャットグループが作成されました。"
  else
    flash[:alert] = "チャットグループの作成に失敗しました。"
    render :new
  end
end


private
def group_params
  params.require(:group).permit(:name)
end

end
