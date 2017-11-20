class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_many :incomes, dependent: :destroy
  has_many :outcomes, dependent: :destroy
  has_many :categories, foreign_key: :creator_id, dependent: :destroy
  has_many :installments, dependent: :destroy
  has_many :item_buyings, dependent: :destroy
end
