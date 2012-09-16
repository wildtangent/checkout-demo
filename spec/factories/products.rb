FactoryGirl.define do
  factory :product do
    
    factory :fruit_tea do
      product_code "FR1"
      name "Fruit tea"
      price 311
    end
    
    factory :strawberries do
      product_code "SR1"
      name "Strawberries"
      price 500
    end
    
    factory :coffee do
      product_code "CF1"
      name "Coffee"
      price 1123
    end
    
  end
end