class ValueByMonth < ApplicationRecord
  ATTRIBUTE_PARAMS =
    %i(item_buying_id estimate_value start_date end_date).freeze

  belongs_to :item_buying

  has_many :installments, dependent: :destroy
end
