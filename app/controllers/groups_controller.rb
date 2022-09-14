class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group, only: %i[show delete]
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    @groups = Group.all
  end
  
  def show; end

  def new
    @user = User.find(params[:user_id])
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to user_groups_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @group.destroy

    redirect_to user_groups_path(current_user.id)
  end


  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
