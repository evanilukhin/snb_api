require 'rails_helper'

RSpec.describe Stocks::Destroy do
  subject(:stock_destroyer) { described_class.call(stock: stock) }

  let(:stock) { create(:stock) }

  before do
    stock
  end

  it { expect(stock_destroyer.success).to eq(true) }
  it { expect(stock_destroyer.data.deleted_at).to be_present }
  it { expect { stock_destroyer }.not_to change(Stock, :count) }
  it { expect { stock_destroyer }.to change(Stock.not_deleted, :count).from(1).to(0) }
  it { expect(stock_destroyer.errors).to be_blank }
end