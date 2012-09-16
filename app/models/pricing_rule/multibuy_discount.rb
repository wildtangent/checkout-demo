class PricingRule::MultibuyDiscount < PricingRule
  
  def total_discount(items)
    items = collect_eligible(items)
    count = items.count
    return 0 if count < quantity
    return discount * items.count      
  end
  
end