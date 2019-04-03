require 'rails_helper'

describe Order do
  context "when the order is placed and valid" do
    let (:product) {
      Product.create!(
        name: "race bike",
        description: "This is a cool bike",
        image_url: "https://i.ibb.co/W5TYCPq/iconfinder-028-Snowman-2792938.png",
      )
    }

    let (:user) {User.create!(email: "grant@email.com", password: "testtest")}

    it "returns a valid order" do
      expect(Order.new(user: user, product: product, total: 100)).to be_valid
    end

    it "returns an invalid order without a user" do
      expect(Order.new(product: product, total: 100)).to_not be_valid
    end

    it "returns an invalid order without a product" do
      expect(Order.new(user: user)).to_not be_valid
    end
  end

end
