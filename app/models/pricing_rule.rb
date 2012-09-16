class PricingRule
  
  attr_accessor :product_codes, :quantity, :discount
  
  def initialize(attributes={})
    @product_codes = attributes[:product_codes]
    @quantity = attributes[:quantity]
    @discount = attributes[:discount]
  end
  
  def eligible?(product)
    @product_codes.include?(product.product_code)
  end
  
  def collect_eligible(items)
    items.select{|item| eligible?(item) }
  end
  
  def total_discount(items)
    0
  end
    
end