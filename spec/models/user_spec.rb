require "rails_helper"

RSpec.describe User, type: :model do
  describe "User validation" do
    context "association" do
      # to do ...
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
