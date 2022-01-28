module Stocks
  class Create < ApplicationService
    def initialize(stock_params: )
      @stock_params = stock_params
    end

    def call
      bearer = Bearer.find_by_name(@stock_params.dig('bearer_attributes', 'name'))

      result =
        if bearer.present?
          Stock.create(@stock_params.except('bearer_attributes').merge(bearer:))
        else
          Stock.create(@stock_params)
        end

      Result.new(success: result.errors.blank?, data: result, errors: result.errors.full_messages)
    end
  end
end