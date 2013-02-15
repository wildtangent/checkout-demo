require 'spec_helper'

describe PricingRule::MultibuyDiscount do
  
  let :rule do
    FactoryGirl.build(:multibuy_discount)
  end
  
  let :fruit_tea do
    FactoryGirl.build(:fruit_tea)
  end
  
  let :strawberries do
    FactoryGirl.build(:strawberries)
  end
  
  
  it 'should return a total discount of 0 given there is one item' do
    items = [strawberries]
    rule.total_discount(items).should == 0
  end
  
  it 'should return a total discount of 0 given there are 2 items' do
    items = [strawberries, strawberries]
    rule.total_discount(items).should == 0
  end  
  
  it 'should return a total discount of 150 given there are 3 eligible items' do
    items = [strawberries, strawberries, strawberries]
    rule.total_discount(items).should == 150
  end
  
  it 'should return a total discount of 150 given there are 3 eligible items and one non-eligible one' do
    items = [strawberries, strawberries, strawberries, fruit_tea]
    rule.total_discount(items).should == 150
  end
  
  it 'should return a total discount of 150 given there are 3 eligible items and two non-eligible ones' do
    items = [strawberries, strawberries, strawberries, fruit_tea, fruit_tea]
    rule.total_discount(items).should == 150
  end
  
  
  it 'should return a total discount of 200 given there are 4 eligible items and two non-eligible ones' do
    items = [strawberries, strawberries, strawberries, strawberries, fruit_tea, fruit_tea]
    rule.total_discount(items).should == 200
  end  

  
end