# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all
# Animal.destroy_all


user1 = User.create(id: "1", email: "jenapotayah@gmail.com", password: "1234567", first_name: "Jena", last_name: "Potayah", phone: "58486292", address: "Quatre-Bornes", has_dog: false, has_cat: true, has_closed_garden: true, has_basket: false, has_kennel: false)
user2 = User.create(id: "2", email: "ansaar@gmail.com", password: "1234567", first_name: "Ansaar", last_name: "Ramkoleea", phone: "59845839", address: "Phoenix", has_dog: false, has_cat: true, has_closed_garden: false, has_basket: false, has_kennel: false)

animal1 = Animal.create(breed: "dog", name: "Pilou", age: 2, ok_sterilised: true, ok_vaccinated: true, handicapped: false, behaviour: Animal::BEHAVIOURS.sample, location: "Port-Louis", user: user1, compatibility: Animal::COMPATIBILITY.sample)
Animal.create(breed: "cat", name: "Tripod", age: 3, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: Animal::BEHAVIOURS.sample, location: "Vacoas", user: user1, compatibility: Animal::COMPATIBILITY.sample)
Animal.create(breed: "dog", name: "Yoko", age: 4, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: Animal::BEHAVIOURS.sample, location: "Tamarin", user: user1, compatibility: Animal::COMPATIBILITY.sample)
Animal.create!(breed: "cat", name: "Caramel", age: 1, ok_sterilised: false, ok_vaccinated: true, handicapped: false, behaviour: Animal::BEHAVIOURS.sample, location: "Curepipe", user: user1, compatibility: Animal::COMPATIBILITY.sample)

adoption1 = Adoption.create(start_date: "2023/10/26", status: "Accepted", user: user1, animal: animal1 )

Chatroom.create(name: "Pilou", adoption: adoption1)
