require "open-uri"

# destroying all before seeding again to avoid duplicates...

Message.destroy_all
Chatroom.destroy_all
Adoption.destroy_all
Animal.destroy_all
User.destroy_all

puts "Users destroyed"

# opening photos for the animals...

caramel1 = URI.open("https://images.unsplash.com/photo-1561037404-61cd46aa615b?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
caramel2 = URI.open("https://media.istockphoto.com/id/1285726078/photo/a-small-white-dog-puppy-breed-jack-russel-terrier-with-beautiful-eyes-lays-on-blancket.jpg?s=1024x1024&w=is&k=20&c=Rs18aI40GC7d1cxEC6rPD7PvGpGD69QdHXdZV4LFXAA=")
caramel3 = URI.open("https://media.istockphoto.com/id/1283665688/photo/dog-breed-jack-russell-terrier.jpg?s=1024x1024&w=is&k=20&c=29VGeVc1gn1xVp2tNjsstWlSUdPkut4EBKZYHBeP-Oc=")

yoko1= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699611100/chiens/IMG_3559_celodi.jpg")
yoko2= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699611100/chiens/IMG_3560_e45eb6.jpg")
yoko3= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699611101/chiens/IMG_3558_m7af5n.jpg")

tripod1= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699608298/chats/IMG_8967_fw1vrj.jpg")
tripod2= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699608299/chats/IMG_1439_ijye08.jpg")
tripod3= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699608299/chats/IMG_1407_jn8lrd.jpg")


pilou1= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699611099/chiens/IMG_2738_tx2cof.jpg")
pilou2= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699611098/chiens/IMG_2206_gbgmid.jpg")
pilou3= URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1699611098/chiens/IMG_2209_a8vcql.jpg")

puts "Photos opened"

# creating users...

user1 = User.create(email: "jenapotayah@gmail.com", password: "1234567", first_name: "Jena", last_name: "Potayah", phone: "58486292", address: "Quatre-Bornes", has_dog: false, has_cat: true, has_closed_garden: true, has_basket: false, has_kennel: false)
user2 = User.create(email: "ansaar@gmail.com", password: "1234567", first_name: "Ansaar", last_name: "Ramkoleea", phone: "59845839", address: "Phoenix", has_dog: false, has_cat: true, has_closed_garden: false, has_basket: false, has_kennel: false)

puts "Users created"


# creating animals and attaching the photos to the animals...
animal1 = Animal.create(breed: "dog", name: "Pilou", age: 2, ok_sterilised: true, ok_vaccinated: true, handicapped: false, behaviour: Animal::BEHAVIOURS.sample, location: "Port-Louis, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample)

animal1.photos.attach(io: pilou1, filename: "IMG_2738_tx2cof", content_type: "image/jpg")
animal1.photos.attach(io: pilou2, filename: "IMG_2206_gbgmid", content_type: "image/jpg")
animal1.photos.attach(io: pilou3, filename: "IMG_2209_a8vcql", content_type: "image/jpg")



animal2 = Animal.create(breed: "cat", name: "Tripod", age: 3, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: Animal::BEHAVIOURS.sample, location: "Vacoas, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample)

animal2.photos.attach(io: tripod1, filename: "IMG_8967_fw1vrj", content_type: "image/jpg")
animal2.photos.attach(io: tripod2, filename: "IMG_1439_ijye08", content_type: "image/jpg")
animal2.photos.attach(io: tripod3, filename: "IMG_1407_jn8lrd", content_type: "image/jpg")



animal3 = Animal.create(breed: "dog", name: "Yoko", age: 4, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: Animal::BEHAVIOURS.sample, location: "Tamarin, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ullamcorper nulla id volutpat faucibus. Proin semper facilisis felis in pharetra. Morbi consequat dolor at finibus gravida. Nulla cursus a lacus sit amet vulputate.")

animal3.photos.attach(io: yoko1, filename: "IMG_3559_celodi", content_type: "image/jpg")
animal3.photos.attach(io: yoko2, filename: "IMG_3560_e45eb6", content_type: "image/jpg")
animal3.photos.attach(io: yoko3, filename: "IMG_3558_m7af5n", content_type: "image/jpg")


animal4 = Animal.create(breed: "cat", name: "Caramel", age: 1, ok_sterilised: false, ok_vaccinated: true, handicapped: false, behaviour: Animal::BEHAVIOURS.sample, location: "Curepipe, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ullamcorper nulla id volutpat faucibus. Proin semper facilisis felis in pharetra. Morbi consequat dolor at finibus gravida. Nulla cursus a lacus sit amet vulputate.")

animal4.photos.attach(io: caramel1, filename: "IMG_2769_xqmavt", content_type: "image/jpg")
animal4.photos.attach(io: caramel2, filename: "IMG_3166_zy82qh", content_type: "image/jpg")
animal4.photos.attach(io: caramel3, filename: "a4c4faef-4272-403e-9853-b3e3ceab7d36_oow47o", content_type: "image/jpg")


adoption1 = Adoption.create(start_date: Date.today, status: "pending", user: user1, animal: animal1)
adoption2 = Adoption.create(start_date: Date.today, status: "pending", user: user1, animal: animal3)
adoption3 = Adoption.create(start_date: Date.today, status: "pending", user: user1, animal: animal2)
adoption4 = Adoption.create(start_date: Date.today, status: "pending", user: user1, animal: animal4)

puts "Animals created, photos attached"



Chatroom.create(name: "Pilou", adoption: adoption1)
Chatroom.create(name: "Tripod", adoption: adoption3)
Chatroom.create(name: "Yoko", adoption: adoption2)
Chatroom.create(name: "Caramel", adoption: adoption4)

puts "Chatrooms created"
