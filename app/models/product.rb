class Product < ActiveRecord::Base

	def self.generate_test_data(size=10000, batch=1000, start=0)
    products =[]
    size=size.to_i
    start=start.to_i
    start.upto(start + size - 1) do |i| 
      products ||=[]
      attrs ={:code=> "#{i}_P_#{i}", :name => "product #{i}", :category_id => i % 20}
      products << attrs

      if (i % batch).zero? || i==(size-1)
        flush(products)
      end

    end

    flush(products) unless products.empty?

    puts ""
    puts "Data size: #{Product.count}"
  end

  private
  def self.flush(products)
    Product.transaction do 
      products.each do |attrs|
        Product.create(attrs)
      end
      print "."
      products.clear
    end
  end
end
