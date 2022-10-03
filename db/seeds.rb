# USERS
brands = %w[Sirena Ruby\ Rose aries Buhito\ Crochet GEMMA Regina Elora Kory INVICTUS Excalibur]

# PRODUCTS
nouns = %w[Shirt Jeans Skirt Trousers Blouse]
adjectives = %w[Soft Beautiful Lovely Hot Great Cool Artistic]

# Limpiar la DB
puts "Cleaning database..."
User.destroy_all
Product.destroy_all
Order.destroy_all

# Los usuarios de tipo Referent tienen role: 1 (ver modelo User)
puts "Creating Referents... 🎈"
10.times do |num|
  referent = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    role: 1,
    password: "123456",
    brand: brands[num],
    description: Faker::Quote.famous_last_words
  )
  referent.save!
end

# Los usuarios Fashion Lover tienen un role: 2, el valor por defecto
puts "Creating Fashion Lovers... 🎃"
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

referents = User.where(role: 1)
fashion_lovers = User.where(role: 2)

puts "Creating products... 👙"
15.times do
  Product.create(
    name: "#{adjectives.sample} #{Faker::Commerce.material} #{nouns.sample}",
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    price: Faker::Commerce.price,
    size: rand(0..3),
    color: rand(0..9),
    category: rand(0..4),
    genre: rand(0..2),
    status: [true, false].sample,
    user_id: referents.sample.id
  )
end

puts "Creating orders... 💰"
5.times do
  Order.create(
    payment: rand(0..2),
    delivery: rand(0..1),
    status: [true, false].sample,
    user_id: fashion_lovers.sample.id,
    product_id: rand(1..15)
  )
end

puts "This is the end, my only friend. The end... 🎶🎸"
puts "Bye!"
