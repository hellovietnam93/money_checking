require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Category validation" do
    context "association" do
      it{is_expected.to have_many :incomes}
      it{is_expected.to have_many :outcomes}

      it{is_expected.to belong_to(:creator).class_name(User.name)}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:name).of_type(:string)}
      it{is_expected.to have_db_column(:creator_id).of_type(:integer)}
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
