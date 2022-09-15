class DealsController < ApplicationController
  load_and_authorize_resource
  before_action :set_deal, only: %i[show]
  before_action :set_group, only: %i[new create]
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    @group = Group.includes(:user).find(params[:group_id]) 
    @deals = @group.deals.includes(:groups).order(created_at: :desc)
  end
  
  def show; end

  def new
    @deal = Deal.new
  end

  def create
    @deal = current_user.deals.new(deal_params)
    @group.deals << @deal

    if @deal.save
      flash[:notice] = 'Deal created successfully.'
      redirect_to user_group_deals_path(@group.id)
    else
      flash[:alert] = 'Deal could not be be created!'
      render :new
    end
  end

  private

  def set_deal
    @deal = Deal.find(params[:id])
  end

  def set_group
    @group = Group.includes(:user).find(params[:group_id])
  end

  def deal_params
    params.require(:deal).permit(:name, :amount)
  end
end
