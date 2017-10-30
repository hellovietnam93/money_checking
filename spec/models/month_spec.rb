require 'rails_helper'

RSpec.describe Month, type: :model do
  describe "Month validation" do
    context "association" do
      it{is_expected.to belong_to :user}
    end

    context "column_specifications" do
      it{is_expected.to have_db_column(:value).of_type(:date)}
      it{is_expected.to have_db_column(:user_id).of_type(:integer)}
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
