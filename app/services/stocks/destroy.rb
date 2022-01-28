module Stocks
  class Destroy < ApplicationService
    def initialize(stock:)
      @stock        = stock
    end

    def call
      @stock.soft_delete

      Result.new(success: @stock.errors.blank?, data: @stock, errors: @stock.errors.full_messages)
    end
  end
end