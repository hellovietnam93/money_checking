class Month < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(user_id value).freeze

  belongs_to :user

  has_many :in_comes, dependent: :destroy
  has_many :out_comes, dependent: :destroy
end
