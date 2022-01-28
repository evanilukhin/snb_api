class Stock < ApplicationRecord
  belongs_to :bearer
  validates_uniqueness_of :name

  scope :not_deleted, ->{ where(deleted_at: nil) }
  accepts_nested_attributes_for :bearer

  def soft_delete
    update(deleted_at: Time.zone.now)
  end
end
