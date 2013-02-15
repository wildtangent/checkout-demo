class PricingRule
  
  attr_accessor :product_codes, :quantity, :discount
  
  # Build a new pricing rule. Expects: 
  # - Array of product codes
  # - Quantity of items that trigger the discount
  # - Amount of discount to apply to each item
  def initialize(attributes={})
    @product_codes = attributes[:product_codes]
    @quantity = attributes[:quantity]
    @discount = attributes[:discount]
  end
  
  # Test if the product is eligable for the discount
  def eligible?(product)
    @product_codes.include?(product.product_code)
  end
  
  # GEt all the eligable products
  def collect_eligible(items)
    items.select{|item| eligible?(item) }
  end
  
  # No calculation performed here, need to implement in subclass
  def total_discount(items)
    0
  end
    
end