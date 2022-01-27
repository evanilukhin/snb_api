class Stock < ApplicationRecord
  belongs_to :bearer
  validates_uniqueness_of :name

  scope :not_deleted, ->{ where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.zone.now)
  end
end
