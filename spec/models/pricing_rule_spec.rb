require 'spec_helper'

describe PricingRule do

  let :fruit_tea do
    FactoryGirl.build(:fruit_tea)
  end
  
  let :strawberries do
    FactoryGirl.build(:strawberries)
  end
  
  let :pricing_rule do
    FactoryGirl.build(:pricing_rule)
  end
  
  let :fruit_tea_pricing_rule do
    FactoryGirl.build(:pricing_rule, product_codes: ["FR1"])
  end
  
  it 'should assign a product code of ["FR1"]' do
    fruit_tea_pricing_rule.product_codes.should == ["FR1"]
  end
  
  it 'should assign a discount of 50 if initialized with that attribute' do
    @pricing_rule = FactoryGirl.build(:pricing_rule, discount: 50)
    @pricing_rule.discount.should == 50
  end
   
  it 'should assign a quantity of 2 if initialized with that attribute' do
    @pricing_rule = FactoryGirl.build(:pricing_rule, quantity: 2)
    @pricing_rule.quantity.should == 2
  end
  
  it 'should return true if the item is eligible' do
    fruit_tea_pricing_rule.eligible?(fruit_tea).should be_true
  end
  
  it 'should return false if the item is not eligible' do
    fruit_tea_pricing_rule.eligible?(strawberries).should be_false
  end
  
  it 'should return a discount of 0' do
    pricing_rule.total_discount([]).should == 0
  end
  
  it 'should return a discount of 0 on two fruit teas, if no discount rule is applied' do
    pricing_rule.total_discount([fruit_tea, fruit_tea]).should == 0
  end
  
end