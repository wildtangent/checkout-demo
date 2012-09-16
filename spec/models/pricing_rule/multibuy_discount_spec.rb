require 'spec_helper'

describe PricingRule::MultibuyDiscount do
  
  before(:each) do
    @rule = FactoryGirl.build(:multibuy_discount)
  end
  
  it 'should return a total discount of 0 given there is one item' do
    items = [FactoryGirl.build(:strawberries)]
    @rule.total_discount(items).should == 0
  end
  
  it 'should return a total discount of 0 given there are 2 items' do
    items = [FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries)]
    @rule.total_discount(items).should == 0
  end  
  
  it 'should return a total discount of 150 given there are 3 eligible items' do
    items = [FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries)]
    @rule.total_discount(items).should == 150
  end
  
  it 'should return a total discount of 150 given there are 3 eligible items and one non-eligible one' do
    items = [FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:fruit_tea)]
    @rule.total_discount(items).should == 150
  end
  
  it 'should return a total discount of 150 given there are 3 eligible items and two non-eligible ones' do
    items = [FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:fruit_tea), FactoryGirl.build(:fruit_tea)]
    @rule.total_discount(items).should == 150
  end
  
  
  it 'should return a total discount of 200 given there are 4 eligible items and two non-eligible ones' do
    items = [FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries), FactoryGirl.build(:strawberries)]
    @rule.total_discount(items).should == 200
  end  

  
end