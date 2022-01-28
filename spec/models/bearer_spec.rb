require 'rails_helper'

RSpec.describe Bearer do
  subject(:bearer) { create(:bearer) }

  it { expect(bearer).to be_valid }
end
