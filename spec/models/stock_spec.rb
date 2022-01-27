require 'rails_helper'

RSpec.describe Stock do
  subject(:stock) { create(:stock) }

  it { expect(stock).to be_valid }

  describe "#soft_delete" do
    subject(:stock_soft_delete) { stock.soft_delete }

    before do
      stock_soft_delete
    end

    it { expect(stock.deleted_at).to be_present }
    it { expect(Stock.all.count).to eq(1) }
    it { expect(Stock.all.not_deleted.count).to eq(0) }
  end
end
