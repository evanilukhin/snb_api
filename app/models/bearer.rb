class Bearer < ApplicationRecord
  has_many :stocks
  validates_uniqueness_of :name
end
