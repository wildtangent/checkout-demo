class Checkout
  
  attr_accessor :pricing_rules, :items
  
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = []
  end
  
  def scan(item)
    @items << item
  end
  
  def total
    #boom
  end
  
end