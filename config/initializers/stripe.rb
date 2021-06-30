Stripe.api_key = ENV["STRIPE_SECRET_KEY"]

puts "hello"
puts Stripe.api_key
puts ENV["STRIPE_SECRET_KEY"]