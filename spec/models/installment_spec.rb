require 'rails_helper'

RSpec.describe Installment, type: :model do
  describe "Installment validation" do
    context "association" do
      it{is_expected.to belong_to :item_buying}
      it{is_expected.to belong_to :value_by_month}
      it{is_expected.to belong_to :user}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:user_id).of_type(:integer)}
      it{is_expected.to have_db_column(:item_buying_id).of_type(:integer)}
      it{is_expected.to have_db_column(:value_by_month_id).of_type(:integer)}
      it{is_expected.to have_db_column(:real_value).of_type(:float)}
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
