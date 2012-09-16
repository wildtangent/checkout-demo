class Checkout
  
  attr_accessor :pricing_rules, :items
  
  # Initialize the checkout, items and rules
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end
  
  # Add an item to the checkout
  def scan(item)
    @items << item
  end
  
  # Return the total as floating point
  def total
    ((apply_rules(sum)).to_f / 100).to_f
  end
  
  # Get the prices and add them together
  def sum
    @items.map(&:price).reduce(:+)    
  end
  
  # Apply available pricing rules
  def apply_rules(value)
    @pricing_rules.each do |rule|
      value -= rule.total_discount(@items)
    end
    value
  end
    
  
end