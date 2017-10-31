class Month < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(user_id value).freeze

  belongs_to :user

  has_many :incomes, dependent: :destroy
  has_many :outcomes, dependent: :destroy
end
