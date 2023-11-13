# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

User.destroy_all
Animal.destroy_all

caramel1 = URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699608298/chats/IMG_2769_xqmavt.jpg")
caramel2 = URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699608298/chats/IMG_3166_zy82qh.jpg")
caramel3 = URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699608298/chats/a4c4faef-4272-403e-9853-b3e3ceab7d36_oow47o.jpg")







user1 = User.create(email: "jenapotayah@gmail.com", password: "1234567", first_name: "Jena", last_name: "Potayah", phone: "58486292", address: "Quatre-Bornes", has_dog: false, has_cat: true, has_closed_garden: true, has_basket: false, has_kennel: false)
user2 = User.create(email: "ansaar@gmail.com", password: "1234567", first_name: "Ansaar", last_name: "Ramkoleea", phone: "59845839", address: "Phoenix", has_dog: false, has_cat: true, has_closed_garden: false, has_basket: false, has_kennel: false)


animal1 = Animal.create(breed: "dog", name: "Pilou", age: 2, ok_sterilised: true, ok_vaccinated: true, handicapped: false, behaviour: Animal::BEHAVIOURS.sample, location: "Port-Louis", user: User.first, compatibility: Animal::COMPATIBILITY.sample)
animal2 = Animal.create(breed: "cat", name: "Tripod", age: 3, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: Animal::BEHAVIOURS.sample, location: "Vacoas", user: User.first, compatibility: Animal::COMPATIBILITY.sample)
animal3 = Animal.create(breed: "dog", name: "Yoko", age: 4, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: Animal::BEHAVIOURS.sample, location: "Tamarin", user: User.first, compatibility: Animal::COMPATIBILITY.sample)
animal4 = Animal.create(breed: "cat", name: "Caramel", age: 1, ok_sterilised: false, ok_vaccinated: true, handicapped: false, behaviour: Animal::BEHAVIOURS.sample, location: "Curepipe", user: User.first, compatibility: Animal::COMPATIBILITY.sample)
animal4.photos.attach(io: caramel1, filename: "IMG_2769_xqmavt", content_type: "image/jpg")
animal4.photos.attach(io: caramel2, filename: "IMG_3166_zy82qh", content_type: "image/jpg")
animal4.photos.attach(io: caramel3, filename: "a4c4faef-4272-403e-9853-b3e3ceab7d36_oow47o", content_type: "image/jpg")

# adoption1 = Adoption.create(start_date: "2023/10/26", status: "Accepted", user: user1, animal: animal1)

# Chatroom.create(name: "Pilou", adoption: adoption1)

# Animals cloudinary images links
