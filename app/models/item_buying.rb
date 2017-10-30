class ItemBuying < ApplicationRecord
  ATTRIBUTE_PARAMS =
    %i(
      user_id category_id price estimate_start_time name web_link status
    ).freeze

  enum status: %i(ready_to_buy planning)

  belongs_to :category
  belongs_to :user

  has_many :value_by_months, dependent: :destroy
  has_many :installments, dependent: :destroy
end
