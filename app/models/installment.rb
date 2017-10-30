class Installment < ApplicationRecord
  ATTRIBUTE_PARAMS =
    %i(item_buying_id user_id value_by_month_id real_value).freeze

  belongs_to :item_buying
  belongs_to :user
  belongs_to :value_by_month
end
