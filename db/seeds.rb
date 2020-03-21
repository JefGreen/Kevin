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
{
  url:'https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=80',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1473531761844-5a14668fc8f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1490195117352-aa267f47f2d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1502773860571-211a597d6e4b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1437913135140-944c1ee62782?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1439402702863-6434b61e6392?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1502773689256-3fb05abd681f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1484446991649-77f7fbd73f1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1440332013745-3a1357afa90c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1465218550585-6d069382d2a9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1465429167186-266ef03d6277?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1525186402429-b4ff38bedec6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1508215302842-8a015a452a20?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1469334031218-e382a71b716b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1448518184296-a22facb4446f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1541983663620-7571a820610c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1501168296011-538e44c26981?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1485727749690-d091e8284ef3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1492462543947-040389c4a66c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1519058082700-08a0b56da9b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1491756975177-a13d74ed1e2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1495603889488-42d1d66e5523?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1492288991661-058aa541ff43?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1496360650824-229a83e340db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1517365830460-955ce3ccd263?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1462804993656-fac4ff489837?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1489980869433-d1f7c7ac0fcf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1492447273231-0f8fecec1e3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1465409042654-5314e9d1754b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1520719627573-5e2c1a6610f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1471017851983-fc49d89c57c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1475552113915-6fcb52652ba2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1495490140452-5a226aef25d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1505136022555-39704db312fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1502980426475-b83966705988?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1521225099409-8e1efc95321d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1464808322410-1a934aab61e5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1478144113946-d55adda4e24e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1494302377477-915db5a8e609?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1513956589380-bad6acb9b9d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1516756587022-7891ad56a8cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1464750329548-977f9793ca3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1492447216082-4726bf04d1d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1533227268428-f9ed0900fb3b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1485218173291-62104d18e1c1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
{
  url:'https://images.unsplash.com/photo-1494708001911-679f5d15a946?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: true,
},
{
  url:'https://images.unsplash.com/photo-1520466809213-7b9a56adcd45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60',
  male: false,
},
# {
#   url:'',
#   male: ,
# },
]

# Contacts 30 - 40
def generateContact(image)
  f_name = image[:male] ? Faker::Name.male_first_name : Faker::Name.female_first_name
  Faker::Config.locale = 'en-CA'
  contact = Contact.create({
    first_name: f_name,
    last_name: Faker::Name.last_name,
    meeting_location: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 35),
    phone_number: Faker::PhoneNumber.unique.cell_phone,
  })
  contact.photo.attach(io: URI.open(image[:url]), filename: "#{Faker::Name.unique.name}.png")
  puts "-#{f_name}"
end

def generateLikes(contact, tags, liked)
  tags.each do |tag|
     Like.create({
      liked: liked,
      tag_id: tag.id,
      contact_id: contact.id,
    })
    Question.create({
      question: "Does #{contact.first_name} #{contact.last_name} like #{tag.name}?",
      correct_answer: liked.to_s,
      contact_id: contact.id,
      question_type: "Like",
    })
  end
end

def generateGroupContacts(contact)
  Group.all.sample(rand(0..5)).each do |group|
    GroupContact.create(
      group_id: group.id,
      contact_id: contact.id
    )
    Question.create(
      question: "Is #{contact.first_name} #{contact.last_name} part of the group called #{group.name}?",
      correct_answer: true.to_s,
      contact: contact,
      question_type: "GroupContact",
    )
  end
end

def generateStoriesAndQuestions()
  30.times do
    Story.create({
      description: Faker::Restaurant.description,
      user_id: User.all.first.id,
      title: "Eating out at #{Faker::Restaurant.name}",
      date: Faker::Date.between(from: 80.days.ago, to: Date.today),
      attachment_id: 1
    })
  end

  Story.all.each do |story|
    Contact.all.sample(rand(2..6)).each do |contact|
      Memory.create(
        story_id: story.id,
        contact_id: contact.id
      )
    end
  end

  # Question.create(
  #   question: "Is #{contact.first_name} #{contact.last_name} part of the story called #{group.name}?",
  #   correct_answer: true.to_s,
  #   contact: contact,
  #   question_type: "Story",
  # )
end

def generateMeetingLocations()
  array = []
  4.times {array.push("#{Faker::Job.unique.field} association in #{rand(2015..2020)}")}
  2.times {array.push("#{Contact.all.sample.first_name}'s #{Faker::Job.education_level} graduation")}
  6.times {array.push("Worked together at #{Faker::Company.unique.name}")}
  12.times {array.push("Game night at #{Contact.all.sample.first_name}'s place")}
  2.times {array.push("Wagon meetup of #{rand(2019..2020)}")}
  # 4.times {array.push("Party with #{Group.all.sample.name} in #{rand(2015..2020)}")}
  array.push("Studied together in Chicoutimi")
  6.times {array.push("Introduced by #{Contact.all.sample.first_name}")}
  4.times {array.push("Meet during my trip in #{Faker::Address.unique.country}")}
  return array
end

puts ''

puts '***********************'
puts 'Currently seeding'
puts '***********************'
puts ''

puts 'Generating Tags'
10.times {Tag.create(name: Faker::Dessert.unique.variety)}
15.times {Tag.create(name: Faker::Food.unique.fruits)}
10.times {Tag.create(name: Faker::ProgrammingLanguage.unique.name)}
15.times {Tag.create(name: Faker::Team.unique.sport)}

puts 'Generating Groups'
['Chess club', 'Board game Wednesday', ]

puts 'Generating Contacts'
puts ''
puts 'Added the following to Kevin:'
images.each do |image|
  generateContact(image)
end

puts ''
puts 'Generating random meeting locations'
meeting_locations = generateMeetingLocations()
Contact.all.each do |contact|
  contact.update(meeting_location: meeting_locations.sample)
end

puts ''
puts 'Generating Likes and Questions'
Contact.all.each do |contact|
  likes = Tag.all.sample(rand(5..10))
  generateLikes(contact, likes, true)

  dislikes = (Tag.all - likes).sample(rand(5..10))
  generateLikes(contact, dislikes, false)
end
puts ''
puts 'Associating Groups with Contacts and generating questions'
10.times {Group.create(name: Faker::Team.unique.sport)}
Contact.all.each do |contact|
  generateGroupContacts(contact)
end
puts ''
puts 'Generating stories with questions'
User.create(
  email: 'admin@admin.com',
  password: '123456',
)
generateStoriesAndQuestions()




puts 'Seeding completed'
