# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all

10.times do
    City.create!(city_name: Faker::Address.city)
end

120.times do
    offset = Random.new.rand(0..9)

    Dog.create!(dog_name: Faker::Creature::Dog.name, city: City.find(City.first.id + offset))

end

40.times do
    offset = Random.new.rand(0..9)

    Dogsitter.create!(dogsitter_name: Faker::Name.first_name, city: City.find(City.first.id + offset))
end

320.times do |i|
    offset = Random.new.rand(0..3)
    stroll_city = City.find(City.first.id + offset)


    city_dogs = stroll_city.dogs

    if city_dogs.length == 0
        next
    end

    offset = Random.new.rand(0..(city_dogs.length - 1))
    stroll_dog = city_dogs[offset]


    city_dogsitters = stroll_city.dogsitters

    if city_dogsitters.length == 0
        next
    end

    offset = Random.new.rand(0..(city_dogsitters.length - 1))
    stroll_dogsitter = city_dogsitters[offset]

    puts "Stroll ##{i + 1}:"
    puts "City: #{stroll_city.id} - #{stroll_city.city_name}"
    puts "Dog: #{stroll_dog} - #{stroll_dog.dog_name} among the #{city_dogs.length} dogs in the city !"
    puts "Dogsitter: #{stroll_dogsitter} - #{stroll_dogsitter.dogsitter_name} among the #{city_dogsitters.length} dogsitters in the city !"
    puts ""

    Stroll.create!(dog: stroll_dog,dogsitter: stroll_dogsitter,city: stroll_city)
end