require 'rails_helper'

RSpec.describe Outcome, type: :model do
  describe "Outcome validation" do
    context "association" do
      it{is_expected.to belong_to :category}
      it{is_expected.to belong_to :month}
      it{is_expected.to belong_to :user}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:user_id).of_type(:integer)}
      it{is_expected.to have_db_column(:category_id).of_type(:integer)}
      it{is_expected.to have_db_column(:month_id).of_type(:integer)}
      it{is_expected.to have_db_column(:name).of_type(:string)}
      it{is_expected.to have_db_column(:value).of_type(:float)}
    end
  end

  describe "instance method" do
    # to do ...
  end

  describe "constant" do
    it "should have a fixed list constant" do
      expect(described_class).to have_constant :ATTRIBUTE_PARAMS
    end
  end
end
