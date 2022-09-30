categories = %w[top bottom dresses shoes accesories]
genres = %w[women men kids unisex]
payment = %w[cash debit credit]
delivery = ["Home delivery", "Shipping to a delivery point"]
sizes = %w[XS S M L XL]

puts "Creating users Referrer"
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    role: true,
    brand: Faker::Commerce.brand,
    description: Faker::Lorem.sentence(word_count: 4)
  )
  user.save!
end

puts "Creating Fashion Lovers"
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    role: false
  )
  user.save!
end

referrers = User.where(role: true)
fashion_lovers = User.where(role: false)

puts "Creating products"
20.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 6),
    price: rand(20..30),
    user_id: referrers.sample.id,
    size: sizes.sample,
    color: Faker::Color.color_name,
    category: categories.sample,
    genre: genres.sample
  )
end

puts "Creating orders"
5.times do
  Order.create(
    status: [true, false].sample,
    payment: payment.sample,
    delivery: delivery.sample,
    user_id: fashion_lovers.sample.id,
    product_id: rand(1..20)
  )
end
