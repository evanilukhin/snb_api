class StocksController < ApplicationController
  before_action :set_stocks, only: [:index]
  before_action :set_stock,  only: [:update, :destroy]

  def index
    render json: as_json(@stocks)
  end

  def create
    result = Stocks::Create.call(stock_params: create_stock_params)

    if result.success
      render json: as_json(result.data)
    else
      render json: result.errors.to_json, status: :not_acceptable
    end
  end

  def update
    result = Stocks::Update.call(stock: @stock, stock_params: update_stock_params)

    if result.success
      render json: as_json(result.data)
    else
      render json: result.errors.to_json, status: :not_acceptable
    end
  end

  def destroy
    result = Stocks::Destroy.call(stock: @stock)

    if result.success
      head :ok
    else
      render json: result.errors.full_messages.to_json, status: :not_acceptable
    end
  end

  private

  def as_json(obj)
    obj.to_json(only: [:id, :name], include: { bearer: { only: [:id, :name] } })
  end

  def set_stocks
    @stocks = Stock.not_deleted.includes(:bearer)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def create_stock_params
    params.require(:stock).permit(:name, bearer_attributes: :name)
  end

  def update_stock_params
    params.require(:stock).permit(:name)
  end
end