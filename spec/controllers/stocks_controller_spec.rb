require 'rails_helper'

RSpec.describe StocksController do
  let(:stock_one) { create(:stock) }
  let(:stock_two) { create(:stock) }

  before do
    stock_one
    stock_two
  end

  describe "GET stocks#index" do
    let(:parsed_response) do
      [
        stock_one.slice(:id, :name).merge('bearer' => stock_one.bearer.slice(:id, :name)),
        stock_two.slice(:id, :name).merge('bearer' => stock_two.bearer.slice(:id, :name))
      ]
    end

    before do
      get :index
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(JSON.parse(response.body)).to eq(parsed_response) }
  end

  describe "POST stocks#create" do
    let(:create_params) { { stock: { name: 'New stock', bearer_attributes: { name: 'New bearer'} } } }
    let(:parsed_response) do
      stock = Stock.find_by_name('New stock')
      stock.slice(:id, :name).merge('bearer' => stock.bearer.slice(:id, :name))
    end


    before do
      post :create, params: create_params
    end

    it { expect(response).to have_http_status(:success) }
    it {expect(JSON.parse(response.body)).to eq(parsed_response)}
  end

  describe "PATCH stocks#update" do
    let(:update_params) { { stock: { name: 'Updated name' } } }
    let(:parsed_response) do
      stock_one.slice(:id).merge('bearer' => stock_one.bearer.slice(:id, :name)).merge('name' => 'Updated name' )
    end


    before do
      patch :update, params: update_params.merge(id: stock_one.id)
    end

    it { expect(response).to have_http_status(:success) }
    it {expect(JSON.parse(response.body)).to eq(parsed_response)}
  end

  describe "DELETE stocks#destroy" do
    before do
      delete :destroy, params: { id: stock_one.id }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(response.body).to be_blank }
    it { expect(Stock.not_deleted.count).to eq(1) }
  end
end