require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Creando usuarios
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "password123",
    name: Faker::Name.name
  )
end

# Creando edificios para cada usuario
User.all.each do |user|
  5.times do
    building = Building.create!(
      transaction_type: ["Venta", "Arriendo"].sample,
      price: Faker::Commerce.price(range: 100_000.0..1_000_000.0, as_string: false),
      address: Faker::Address.street_address,
      area_sq_meter: Faker::Number.between(from: 50, to: 500),
      bedroom_count: Faker::Number.between(from: 1, to: 5),
      bathroom_count: Faker::Number.between(from: 1, to: 3),
      user_id: user.id
    )

    # Creando fotos para el edificio
    3.times do
      photo = Photo.create!(
        priority: Faker::Number.between(from: 1, to: 10),
        building_id: building.id
      )

      # Adjuntando una imagen ficticia usando Active Storage
      image_url = Faker::LoremFlickr.image(size: "200x300", search_terms: ['building']) # Imagen relacionada con edificios de 200x300
      file = URI.open(image_url)
      photo.image.attach(io: file, filename: "placeholder.png", content_type: "image/png")
    end
  end
end
