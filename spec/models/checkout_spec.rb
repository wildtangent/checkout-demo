require 'spec_helper'

describe Checkout do
  
  before(:each) do
    @fruit_tea = FactoryGirl.build(:fruit_tea)
    @strawberries = FactoryGirl.build(:strawberries)
    @coffee = FactoryGirl.build(:coffee)    

    pricing_rules = [
      FactoryGirl.build(:multibuy_discount),
      FactoryGirl.build(:bogof_discount)
    ]
    @checkout = Checkout.new(pricing_rules)
  end
  
  it 'should NOT return a value of 22.25' do
    scan_items(@fruit_tea, @strawberries, @fruit_tea.dup, @coffee)
    @checkout.total.should_not == 22.25
  end
  
  it 'should really return a value of 19.34' do
    scan_items(@fruit_tea, @strawberries, @fruit_tea.dup, @coffee)
    @checkout.total.should == 19.34
  end
  
  it 'should return a value of 3.11' do
    scan_items(@fruit_tea, @fruit_tea)
    @checkout.total.should == 3.11
  end
  
  it 'should return a value of 16.61' do
    scan_items(@strawberries.dup, @strawberries.dup, @fruit_tea, @strawberries.dup)
    @checkout.total.should == 16.61
  end
  
  # Helper to put items through the checkout
  def scan_items(*items)
    items.each do |item|
      @checkout.scan(item)
    end
  end
  
end