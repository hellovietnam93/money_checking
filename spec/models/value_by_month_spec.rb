require 'rails_helper'

RSpec.describe ValueByMonth, type: :model do
  describe "User validation" do
    context "association" do
      it{is_expected.to have_many :installments}

      it{is_expected.to belong_to :item_buying}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:item_buying_id).of_type(:integer)}
      it{is_expected.to have_db_column(:estimate_value).of_type(:float)}
      it{is_expected.to have_db_column(:start_date).of_type(:date)}
      it{is_expected.to have_db_column(:end_date).of_type(:date)}
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
