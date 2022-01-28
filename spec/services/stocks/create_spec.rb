require 'rails_helper'

RSpec.describe Stocks::Create do
  subject(:stock_creator) { described_class.call(stock_params: stock_params) }

  context "with new bearer" do
    let(:stock_params) { { name: 'Stock name', bearer_attributes: {name: 'Bearer name'}}.with_indifferent_access }

    it { expect(stock_creator.success).to eq(true) }
    it { expect(stock_creator.data.name).to eq('Stock name') }
    it { expect(stock_creator.data.bearer.name).to eq('Bearer name') }
    it { expect(stock_creator.errors).to be_blank }
  end

  context "with existing bearer" do
    let(:bearer) { create(:bearer) }
    let(:stock_params) { { name: 'Stock name', bearer_attributes: {name: bearer.name}}.with_indifferent_access }

    it { expect(stock_creator.success).to eq(true) }
    it { expect(stock_creator.data.name).to eq('Stock name') }
    it { expect(stock_creator.data.bearer.id).to eq(bearer.id) }
    it { expect(stock_creator.errors).to be_blank }
  end
end