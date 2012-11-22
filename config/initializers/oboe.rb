if defined?(Oboe)
  # Use these when there is no webserver to initiate tracing (apache/nginx)
  #Oboe::Config[:tracing_mode] = 'always'
  # sample_rate is a value from 0 - 1m indicating the fraction of requests per million to trace
  #Oboe::Config[:sample_rate] = 100000 # default 10%
  #
  # Verbose output of instrumentation initialization
  Oboe::Config[:verbose] = true
end