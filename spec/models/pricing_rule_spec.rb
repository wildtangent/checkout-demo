require 'spec_helper'

describe PricingRule do
  
  it 'should assign a product code of ["FR1"]' do
    @pricing_rule = FactoryGirl.build(:pricing_rule, product_codes: ["FR1"])
    @pricing_rule.product_codes.should == ["FR1"]
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
    @pricing_rule = FactoryGirl.build(:pricing_rule, product_codes: ['FR1'])
    @item = FactoryGirl.build(:fruit_tea)
    @pricing_rule.eligible?(@item).should be_true
  end
  
  it 'should return false if the item is not eligible' do
    @pricing_rule = FactoryGirl.build(:pricing_rule, product_codes: ['FR1'])
    @item = FactoryGirl.build(:strawberries)
    @pricing_rule.eligible?(@item).should be_false
  end
  
  it 'should return a discount of 0' do
    @pricing_rule = FactoryGirl.build(:pricing_rule)
    @pricing_rule.total_discount([]).should == 0
  end
  
  it 'should return a discount of 0 on two fruit teas, if no discount rule is applied' do
    @pricing_rule = FactoryGirl.build(:pricing_rule)
    @pricing_rule.total_discount([FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea)]).should == 0
  end
  
end