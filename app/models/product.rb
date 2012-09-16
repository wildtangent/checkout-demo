class Product
    
  attr_accessor :product_code, :name, :price, :reduction
  
  def initialize(attributes={})
    @product_code = attributes[:product_code]
    @name = attributes[:name]
    @price = attributes[:price]
  end
  
end