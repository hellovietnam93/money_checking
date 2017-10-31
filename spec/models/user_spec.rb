require "rails_helper"

RSpec.describe User, type: :model do
  describe "User validation" do
    context "association" do
      it{is_expected.to have_many :incomes}
      it{is_expected.to have_many :outcomes}
      it{is_expected.to have_many :installments}
      it{is_expected.to have_many :months}
      it{is_expected.to have_many(:categories).with_foreign_key :creator_id}
      it{is_expected.to have_many :item_buyings}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:username).of_type(:string)}
      it{is_expected.to have_db_column(:email).of_type(:string)}
      it{is_expected.to have_db_column(:encrypted_password).of_type(:string)}
    end
  end

  describe "instance method" do
    # to do ...
  end

  describe "constant" do
    # to do ...
  end
end
