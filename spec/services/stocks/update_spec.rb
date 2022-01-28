require 'rails_helper'

RSpec.describe Stocks::Update do
  subject(:stock_updater) { described_class.call(stock: stock, stock_params: stock_params) }

  let(:stock) { create(:stock) }
  let(:stock_params) { { name: 'New stock name' } }

  it { expect(stock_updater.success).to eq(true) }
  it { expect { stock_updater }.to change(stock, :name).to('New stock name') }
  it { expect(stock_updater.errors).to be_blank }
end