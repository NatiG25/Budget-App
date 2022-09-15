class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group, only: %i[show]
  before_action :authenticate_user!, only: %i[new create index]

  def index
    @user = User.find(params[:user_id])
    @groups = @user.groups.includes(:deals)
  end
  
  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      flash[:notice] = 'Budget category successfully created!'
      redirect_to user_groups_path(current_user.id)
    else
      flash[:alert] = 'Category could not be created!'
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
