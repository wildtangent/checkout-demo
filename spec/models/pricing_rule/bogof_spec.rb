require 'spec_helper'

describe PricingRule::Bogof do
  
  before(:each) do
    @rule = FactoryGirl.build(:bogof_discount)
  end
  
  it 'should return a total discount of 0 given there is 1 BOGOF item present' do
    items = [FactoryGirl.build(:fruit_tea)]
    @rule.total_discount(items).should == 0
  end
  
  it 'should return a total discount of 311 given there are 2 BOGOF items present' do
    items = [FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea)]
    @rule.total_discount(items).should == 311
  end  
  
  it 'should return a total discount of 311 given there are 3 BOGOF items present' do
    items = [FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea)]
    @rule.total_discount(items).should == 311
  end
  
  it 'should return a total discount of 622 given there are 4 BOGOF items present' do
    items = [FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea)]
    @rule.total_discount(items).should == 622
  end
  
  
  
end