# Multibuy Pricing Rule
# Accepts:
#   product codes as Array
#   quantity of items needed to qualify for discount
#   discount in pence to be applied to each eligible product
class PricingRule::MultibuyDiscount < PricingRule
  
  def total_discount(items)
    items = collect_eligible(items)
    count = items.count
    return 0 if count < quantity
    return discount * count      
  end
  
end