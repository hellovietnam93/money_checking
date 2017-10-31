class Category < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(name).freeze

  belongs_to :creator, class_name: User.name

  has_many :in_comes, dependent: :destroy
  has_many :out_comes, dependent: :destroy
end
