require 'spec_helper'

describe Product do
  
  it 'should assign a product code' do
    @product = FactoryGirl.build(:product, {product_code: "FR1"})
    @product.product_code.should == "FR1"
  end
  
  it 'should assign a name' do
    @product = FactoryGirl.build(:product, {name: "Fruit tea"})
    @product.name.should == "Fruit tea"
  end
   
  it 'should assign a price' do
    @product = FactoryGirl.build(:product, {price: 311})
    @product.price.should == 311
  end
  
end