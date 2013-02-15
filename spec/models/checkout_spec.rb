require 'spec_helper'

describe Checkout do
  
  let :fruit_tea do
    FactoryGirl.build(:fruit_tea)
  end
  
  let :strawberries do
    FactoryGirl.build(:strawberries)
  end
  
  let :coffee do
    FactoryGirl.build(:coffee)    
  end
  
  let :pricing_rules do
    [
      FactoryGirl.build(:multibuy_discount),
      FactoryGirl.build(:bogof_discount)
    ]
  end
  
  let :checkout do
    Checkout.new(pricing_rules)
  end
  
  
  it 'should NOT return a value of 22.25' do
    scan_items(fruit_tea, strawberries, fruit_tea, coffee)
    checkout.total.should_not == 22.25
  end
  
  it 'should really return a value of 19.34 ((311+311+500+1123) - 311).to_f' do
    scan_items(fruit_tea, strawberries, fruit_tea, coffee)
    checkout.total.should == 19.34
  end
  
  it 'should return a value of 3.11' do
    scan_items(fruit_tea, fruit_tea)
    checkout.total.should == 3.11
  end
  
  it 'should return a value of 16.61' do
    scan_items(strawberries, strawberries, fruit_tea, strawberries)
    checkout.total.should == 16.61
  end
  
  # Helper to put items through the checkout
  def scan_items(*items)
    items.each do |item|
      checkout.scan(item)
    end
  end
  
end