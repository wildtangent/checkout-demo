require 'spec_helper'

describe Checkout do
  
  before(:each) do
    @fruit_tea = FactoryGirl.build(:fruit_tea)
    @strawberries = FactoryGirl.build(:strawberries)
    @coffee = FactoryGirl.build(:coffee)    

    pricing_rules = []
    @checkout = Checkout.new(pricing_rules)
  end
  
  it 'should return a value of 22.25' do
    scan_items(@fruit_tea, @strawberries, @fruit_tea, @coffee)
    @checkout.total.should == "22.25"
  end
  
  it 'should return a value of 3.11' do
    scan_items(@fruit_tea, @fruit_tea)
    @checkout.total.should == "3.11"
  end
  
  it 'should return a value of 16.61' do
    scan_items(@strawberries, @strawberries, @fruit_tea, @strawberries)
    
    
    @checkout.total.should == "16.61"
  end
  
  def scan_items(*items)
    items.each do |item|
      @checkout.scan(item)
    end
  end
  
end