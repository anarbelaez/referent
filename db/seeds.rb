categories = ["shirt", "jeans", "shoes"]
genres = ["women", "men", "kids", "unisex"]
payment = ["Cash", "Debit Card", "Credit Card"]
delivery = ["Home delivery", "Shipping to a delivery point"]
sizes = ["S", "M", "L"]

puts "Creating users"
10.times do
  role = [true, false].sample # True --> Referrer, False: Fashion Lover
  User.create(
    first_name: ,
    last_name: ,
    email: Faker::Internet.email,
    password: "12345",
    role: role,
    if role == true
      brand: Faker::Commerce.brand
      description: Faker::Lorem.sentence(word_count: 4)
    end
  )
end

referrers = User.where(role: true)
fashion_lovers = User.where(role: false)

puts "Creating products"
20.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 6),
    price: Faker::Commerce.price,
    stock: rand(1..20),
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
    status: ,
    quantity: rand(1..5),
    payment: payment.sample,
    delivery: delivery.sample,
    user_id: fashion_lovers.sample.id,
    product_id: rand(1..20)
  )
end
