class Income < ApplicationRecord
  ATTRIBUTE_PARAMS =
    %i(month_id user_id category_id name value note main_income).freeze

  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :value, presence: true
end
