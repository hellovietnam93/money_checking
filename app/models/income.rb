class Income < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(month_id user_id category_id name value note).freeze

  belongs_to :category
  belongs_to :month
  belongs_to :user
end
