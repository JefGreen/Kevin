# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'date'
require 'faker'
require "open-uri"

puts '***********************'
puts 'Clearing the current db'
User.destroy_all
puts '-Deleted Users'

Contact.destroy_all
puts '-Deleted Contacts'
puts '-Deleted Likes at the same time'
puts '-Deleted Group_contact at the same time'
puts '-Deleted Questions at the same time'
puts '-Deleted Answers at the same time'

Tag.destroy_all
puts '-Deleted Tags'

Group.destroy_all
puts '-Deleted Groups'

Story.destroy_all
puts '-Deleted Stories'

Memory.destroy_all
puts '-Deleted Memories'

puts 'Clearing db completed'
puts '***********************'


# Contacts 30 - 40
def generateContact(image)
  contact = Contact.create({
    first_name: image.male ? Faker::Name.male_first_name : Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    meeting_location: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  })
  contact.photo.attach(io: URI.open(image.url), filename: "#{Faker::Name.unique.name}.png")
end

# Types of tags
def generateTagsDesserts(nbTimes)
  nbTimes.times do
    Tag.create({
      name: Faker::Dessert.variety,
    })
  end
end

def generateTagsFruits(nbTimes)
  nbTimes.times do
    Tag.create({
      name: Faker::Food.fruits,
    })
  end
end

def generateLikes()
  nbTimes.times do
    Tag.create({
      name: Faker::Food.fruits,
    })
  end
end
# Images male=true femal=false
images = [
{
  url:'https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1505503693641-1926193e8d57?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1464746133101-a2c3f88e0dd9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1492446845049-9c50cc313f00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1484863137850-59afcfe05386?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1457131760772-7017c6180f05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1496840220025-4cbde0b9df65?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1527631746610-bca00a040d60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1441716844725-09cedc13a4e7?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1500336624523-d727130c3328?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1484972759836-b93f9ef2b293?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1485178575877-1a13bf489dfe?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1492447166138-50c3889fccb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1515486191131-efd6be9f711f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1489779162738-f81aed9b0a25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1498387727476-b30055b2ef21?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1484588168347-9d835bb09939?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1479936343636-73cdc5aae0c3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1450297350677-623de575f31c?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true
},
{
  url:'https://images.unsplash.com/photo-1509955252650-8f558c2b8735?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: false,
},
# {
#   url:'',
#   male: ,
# },
# {
#   url:'',
#   male: ,
# },
]

puts ''

puts '***********************'
puts 'Currently seeding'
puts '***********************'
puts ''


puts 'Generating Tags'
generateTagsDesserts(10)
generateTagsFruits(15)

puts 'Generating Contacts'
images.shuffle.take(2).each do |image|
  generateContact(image)
end

puts 'Generating Likes'
Contact.all



# jeff = User.create({
#   email: "jeff@gmail.com",
#   password: 'apple1',
#   name: "Jeff",
#   description: Faker::TvShows::MichaelScott.quote,
#   location: '21 jump Street, Pasig, Metro Manila, Philippines'
# })

# def generateContact()
#   User.create({
#     first_name: "jeff@gmail.com",
#     last_name: 'apple1',
#     meeting_location: "Jeff",
#     birthday: faker.date.past(10),
#   })
# end

# Question.create({
#   question: "Does Jeff likes ski?",
#   right_answer: true,
#   contact_id: 3,
# })

# Question.find_by(question: "Does Jeff likes ski?").update

# tags = ['Ruby', 'JavaScript', 'HTML & CSS', 'UI/UX', 'PHP', 'Angular', 'Google Script', 'Python', 'C#', 'Java', 'React']

# tags.each {|tag| Like.create({ name: skill })}

# skills = Skill.all

# defaul_image = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
# boss_image = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Steve_Carell_2010.jpg/170px-Steve_Carell_2010.png'
# jeff_image = 'https://www.geo.tv/assets/uploads/updates/2020-02-20/273395_7652016_updates.jpg'

# def generateExperiences(user, skills)
#   selected_skills = []
#   rand(1..5).times do
#     skill = (skills - selected_skills).sample
#     selected_skills.push(skill)
#     Experience.create(
#     user: user,
#     skill: skill,
#     years_of_experience: rand(1..7)
#     )
#   end
# end

# def generateMeetings(user, mentor)
#   if mentor
#     mentor = user
#     mentee = (User.all - [user]).sample
#   else
#     mentor = (User.all - [user]).sample
#     mentee = user
#   end

#   Meeting.create({
#     start_time: DateTime.new(2020,9,1,17),
#     end_time: DateTime.new(2020,9,1,18),
#     location: LOCATIONS.sample,
#     mentor_id: mentor.id,
#     mentee_id: mentee.id,
#     accepted: [true, nil].sample
#   })
# end

# def generateReviews(user)
#   rand(2..4).times do
#     user_mentee = (User.all - [user]).sample
#     Review.create({
#       rate: rand(3..5),
#       content: Faker::Quote.matz,
#       mentor_id: user.id,
#       mentee_id: user_mentee.id
#       })
#   end
# end

#  admin = []


# image_index = 0
# images.length().times do
#   name = Faker::Name.unique.name

#   user = User.create({
#     email: Faker::Internet.email,
#     password: 'guest1',
#     name: name,
#     description: Faker::TvShows::MichaelScott.quote,
#     location: LOCATIONS.sample
#   })

#   generateExperiences(user, skills)
#   image = images[image_index]
#   user.photo.attach(io: URI.open(image), filename: "#{name}.png")
#   image_index += 1
# end

# jeff = User.create({
#   email: "jeff@gmail.com",
#   password: 'apple1',
#   name: "Jeff",
#   description: Faker::TvShows::MichaelScott.quote,
#   location: '21 jump Street, Pasig, Metro Manila, Philippines'
# })
# jeff.photo.attach(io: URI.open(jeff_image), filename: "Jeff.png")
# generateExperiences(jeff, skills)
# generateReviews(jeff)
# generateMeetings(jeff, true)
# generateMeetings(jeff, false)

# aline = User.create({
#     email: "aline@gmail.com",
#     password: 'apple1',
#     name: "Aline",
#     description: Faker::TvShows::MichaelScott.quote,
#     location: '5333 Casgrain Avenue, Montreal, Quebec H2T 1X3'
#   })
# aline.photo.attach(io: URI.open(boss_image), filename: "Aline.png")
# generateExperiences(aline, skills)
# generateReviews(aline)

# generateMeetings(aline, true)
# generateMeetings(aline, true)
# generateMeetings(aline, true)
# generateMeetings(aline, false)
# generateMeetings(aline, false)

puts 'Seeding completed'
