class Vote < ApplicationRecord
  validates :user_id, presence: true
  validates :work_id, presence: true

  has_one :user
  has_one :work

end
