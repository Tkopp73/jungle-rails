require 'rails_helper'

describe Product, type: :model do
  describe 'Validations' do
    before do
    @category = Category.new(:name => 'leafy')
    @product = Product.create(:name => 'maple', :category => @category, :price_cents => 100000, :quantity => 1)
    end

    it "should validate presence of name" do
      expect(@product.name).to be_a_kind_of(String)
    end
    it "should validate presence of price" do
      expect(@product.price_cents).to be_a_kind_of(Integer)
    end
    it "should validate presence of quantity" do
      expect(@product.quantity).to be_a_kind_of(Integer)
    end
    it "should validate presence of category" do
      expect(@product.category).to eq(@category)
    end
    it "should validate presence of category" do
      expect(@category).to be_present
    end
  end
end
