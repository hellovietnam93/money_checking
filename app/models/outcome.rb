class Outcome < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(month_id user_id category_id name value note).freeze

  belongs_to :category
  belongs_to :month
  belongs_to :user

  validates :name, presence: true
  validates :value, presence: true
end
