class GroupsController < ApplicationController

  before_action :set_group, :set_current_groups, only: %i(edit update)

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "チャットグループが編集されました。"
    else
      flash.now[:alert] = "チャットグループの作成に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "チャットグループが編集されました。"
    else
      flash.now[:alert] ="チャットグループの編集に失敗しました。"
      render :new
    end
  end


  private

    def group_params
      params.require(:group).permit(:name, { user_ids: [] })
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def set_current_groups
      @groups = current_user.groups
    end


end
