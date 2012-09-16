FactoryGirl.define do
  factory :pricing_rule do
  end
  
  factory :multibuy_discount, class: PricingRule::MultibuyDiscount do 
    product_codes ["SR1"]
    quantity 3
    discount 50
  end
  
  factory :bogof_discount, class: PricingRule::Bogof do
    product_codes ["FR1"]
  end
end