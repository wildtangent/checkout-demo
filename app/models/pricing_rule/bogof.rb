class PricingRule::Bogof < PricingRule
  
  def total_discount(items)
    items = collect_eligible(items)
    count = items.count
    ((count - count % 2)/2) * items.first.price
  end
  
end