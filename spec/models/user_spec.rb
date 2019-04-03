require 'rails_helper'

describe User do
  context "When user is present" do

    it "is valid when password and email are present" do
      expect(User.new(email: "wayne@gmail.com", password: "testtest")).to be_valid
    end

    it "is invalid without a password" do
      expect(User.new(email: "wayne@email.com")).to_not be_valid
    end

    it "is invalid without an email" do
      expect(User.new(password: "testtest")).to_not be_valid
    end
  end
end
