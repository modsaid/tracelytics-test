namespace :tracelytics_test do 

  DEFAULT_SIZE=10000
  DEFAULT_BATCH=1000
  DEFAULT_START=0
  desc "Generate test data to fill the database takes SIZE [#{DEFAULT_SIZE}] and BATCH [#{DEFAULT_BATCH}] arguments"
  task :generate_test_data => :environment do 
    size = (ENV['SIZE'] || DEFAULT_SIZE).to_i
    batch = (ENV['BATCH'] || DEFAULT_BATCH).to_i
    start = (ENV['START'] || DEFAULT_START).to_i

    puts "generating with SIZE=#{size}, BATCH=#{batch}"
    Product.generate_test_data(size, batch, start)
  end

  desc "Generate codes file"
  task :generate_codes_file do 
    max=5000000
    File.open('keys.txt','w'){|f| max.times{ i=rand(max); f.puts "#{i}_P_#{i}" }};''
  end
end