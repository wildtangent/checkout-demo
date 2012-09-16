require 'spec_helper'

describe PricingRule::Bogof do
  
  before(:each) do
    @rule = FactoryGirl.build(:bogof_discount)
  end
  
  it 'should return 3 discounted items (3x BOGOF)' do
    @rule.send(:discounted_items, 6).should == 3
  end
  
  it 'should return 2 discounted items if there is a count of 5 (2x BOGOF, 1 additional)' do
    @rule.send(:discounted_items, 5).should == 2
  end

  it 'should return 2 discounted items if there is a count of 4 (2x BOGOF)' do
    @rule.send(:discounted_items, 4).should == 2
  end  
  
  it 'should return 1 discounted item (1x BOGOF)' do
    @rule.send(:discounted_items, 2).should == 1
  end
  
  it 'should return 0 discounted items (1 item only)' do
    @rule.send(:discounted_items, 1).should == 0
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