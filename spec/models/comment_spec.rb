require 'rails_helper'

describe Comment do
	context "when the comment is being validated" do
		it "is not valid without a rating" do
			@comment = FactoryBot.build(:comment, rating: nil)
			expect(@comment).not_to be_valid
		end

		it "is not valid without a body" do
			@comment = FactoryBot.build(:comment, body: nil)
			expect(@comment).not_to be_valid
		end

		it "is not valid without a user" do
			@comment = FactoryBot.build(:comment, user: nil)
			expect(@comment).not_to be_valid
		end

		it "is not valid without a product" do
			@comment = FactoryBot.build(:comment, product: nil)
			expect(@comment).not_to be_valid
		end
	end
end
