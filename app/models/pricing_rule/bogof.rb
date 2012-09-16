# BOGOF pricing rule. Use to define items which are eligible for Buy One Get One Free
class PricingRule::Bogof < PricingRule
  
  def total_discount(items)
    items = collect_eligible(items)
    count = items.count
    discounted_items(count) * items.first.price
  end
  
  private
  
  # Calculate how mamy items to discount
  # count % 2 return "1" if there are not even number of eligible items
  # (count - count % 2)/2 gives us the number of discountable items
  # e.g. ((4 - 4%2)/2) == ((4 - 0)/2) == (4/2) == 2
  # or (5 - 5%2)/2 == (5 - 1)/2 == (4/2) == 2
  # or (1 - 1%2)/2 == (1-1)/2 == 0/2 == 0
  # or (6 - 6%2)/2 == (6 - 0)/2 == (6/2) == 3
  # etc
  def discounted_items(count)
    ((count - count % 2)/2)
  end
  
end