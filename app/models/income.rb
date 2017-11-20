class Income < ApplicationRecord
  ATTRIBUTE_PARAMS =
    %i(month user_id category_id name value note main_income).freeze
  MONTH_QUERY = "extract(year from month) = ? && extract(month from month) = ?"

  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :value, presence: true
  validates :month, presence: true

  scope :in_month, ->(year, month){where MONTH_QUERY, year, month}
end
