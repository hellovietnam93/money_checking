class Category < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(name).freeze

  belongs_to :creator, class_name: User.name

  has_many :incomes, dependent: :destroy
  has_many :outcomes, dependent: :destroy

  validates :name, presence: true
end
