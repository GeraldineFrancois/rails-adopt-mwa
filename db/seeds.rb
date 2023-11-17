require "open-uri"

# destroying all before seeding again to avoid duplicates...

Message.destroy_all
Chatroom.destroy_all
Adoption.destroy_all
Animal.destroy_all
User.destroy_all

puts "Users destroyed"

# opening photos for the animals...

caramel1 = URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1700207935/development/xtfip3fsl3wlc2btmyqo3joum6kn.jpg")
caramel2 = URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1700207939/development/ecfn0l988j7re3pnxhdc53ods8wo.jpg")
caramel3 = URI.open("https://res.cloudinary.com/dnhbgkoqn/image/upload/v1700207943/development/aq62x9id8zzwz1c97i2lecyjsoqj.jpg")

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
animal1 = Animal.create(breed: "dog", name: "Pilou", age: 2, ok_sterilised: true, ok_vaccinated: true, handicapped: false, behaviour: "playful", location: "Port-Louis, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample, description: "Playful dog, with a difficult start in life. Pilou will be a great fit if you like long walk and car ride.")

animal1.photos.attach(io: pilou1, filename: "IMG_2738_tx2cof", content_type: "image/jpg")
animal1.photos.attach(io: pilou2, filename: "IMG_2206_gbgmid", content_type: "image/jpg")
animal1.photos.attach(io: pilou3, filename: "IMG_2209_a8vcql", content_type: "image/jpg")



animal2 = Animal.create(breed: "cat", name: "Tripod", age: 3, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: "playful", location: "Vacoas, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample, description: "Tripod was unlucky: he was hit by a car and lost a leg. But that doesn't stop him from being playful and very cuddly. You have the chance to turn his life around by giving him a home.")

animal2.photos.attach(io: tripod1, filename: "IMG_8967_fw1vrj", content_type: "image/jpg")
animal2.photos.attach(io: tripod2, filename: "IMG_1439_ijye08", content_type: "image/jpg")
animal2.photos.attach(io: tripod3, filename: "IMG_1407_jn8lrd", content_type: "image/jpg")



animal3 = Animal.create(breed: "dog", name: "Yoko", age: 4, ok_sterilised: true, ok_vaccinated: true, handicapped: true, behaviour: "calm", location: "Tamarin, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample, description: "Yoko was found in the street, he is now sterilized and trained, he is calm indoors and loves cats. He will be a perfect companion.")

animal3.photos.attach(io: yoko1, filename: "IMG_3559_celodi", content_type: "image/jpg")
animal3.photos.attach(io: yoko2, filename: "IMG_3560_e45eb6", content_type: "image/jpg")
animal3.photos.attach(io: yoko3, filename: "IMG_3558_m7af5n", content_type: "image/jpg")


animal4 = Animal.create(breed: "cat", name: "Caramel", age: 2, ok_sterilised: false, ok_vaccinated: true, handicapped: false, behaviour: "calm", location: "Curepipe, Mauritius", user: User.first, compatibility: Animal::COMPATIBILITY.sample, description: "Caramel isn't like other cats, he lost an eye when he was little and didn't receive the necessary care in time. He's very affectionate and playful, and will make you laugh like never before.")

animal4.photos.attach(io: caramel1, filename: "xtfip3fsl3wlc2btmyqo3joum6kn", content_type: "image/jpg")
animal4.photos.attach(io: caramel2, filename: "ecfn0l988j7re3pnxhdc53ods8wo", content_type: "image/jpg")
animal4.photos.attach(io: caramel3, filename: "aq62x9id8zzwz1c97i2lecyjsoqj", content_type: "image/jpg")


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
