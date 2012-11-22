namespace :tracelytics_test do 

  DEFAULT_SIZE=10000
  DEFAULT_BATCH=1000
  desc "Generate test data to fill the database takes SIZE [#{DEFAULT_SIZE}] and BATCH [#{DEFAULT_BATCH}] arguments"
  task :generate_test_data => :environment do 
    size = ENV['SIZE'] || DEFAULT_SIZE
    batch = ENV['BATCH'] || DEFAULT_BATCH

    puts "generating with SIZE=#{size}, BATCH=#{batch}"
    Product.generate_test_data(size, batch)
  end
end