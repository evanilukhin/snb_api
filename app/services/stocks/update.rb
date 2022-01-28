module Stocks
  class Update < ApplicationService
    def initialize(stock: , stock_params: )
      @stock        = stock
      @stock_params = stock_params
    end

    def call
      @stock.update(@stock_params)

      Result.new(success: @stock.errors.blank?, data: @stock, errors: @stock.errors.full_messages)
    end
  end
end