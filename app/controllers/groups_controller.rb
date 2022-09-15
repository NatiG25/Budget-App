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
    @group = current_user.groups.new(group_params)

    if @group.save
      flash[:notice] = 'Budget category successfully created!'
      redirect_to user_groups_path(current_user.id)
    else
      flash[:alert] = 'Category could not be created!'
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
    params.permit(:name, :icon)
  end
end
