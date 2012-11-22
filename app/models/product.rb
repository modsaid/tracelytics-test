class Product < ActiveRecord::Base

	def self.generate_test_data(size=10000, batch=1000)
    products =[]
    size.to_i.times do |i| 
      products ||=[]
      attrs ={:code=> "#{i}_P_#{i}", :name => "product #{i}", :category_id => i % 20}
      products << attrs

      if (i % batch).zero? || i==(size-1)
        Product.transaction do 
          products.each do |attrs|
            Product.create(attrs)
          end
          print "."
          products.clear
        end
      end

    end
    puts ""
    puts "Data size: #{Product.count}"
  end
end
