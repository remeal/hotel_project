# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Type model
require 'faker'
Type.create(link: "Апартаменты", description: "Апартаменты это роскошный комфортабельный номер, состоящий из гостиной, двух спален, ванной комнаты и гостевого туалета. В номере есть стол с 6 мягкими стульями, журнальный стол,сервант, холодтльник, набор посуды.",
             price: 11270, quantity: 6)
Type.create(link: "Бизнес", description: "Из окна этого светлого номера бизнес-класса, оснащенного современной удобной мебелью, открывается панорамный вид на город. Тщательно подобранный интерьер создает атмосферу уюта и комфорта для плодотворной работы или беспечного отдыха.В числе удобств — телевизор с плоским экраном, кондиционер и холодильник. Собственная ванная комната укомплектована феном и бесплатными туалетными принадлежностями.",
             price: 4930, quantity: 1)
Type.create(link: "Большой семейный", description: "Полностью обновленный комфортабельный пятиместный номер состоит из гостиной, двух спален, ванной комнаты и гостевого туалета. Расположение номера позволяет любоваться видами города, открывающимися в разных направлениях.",
             price: 9460, quantity: 5)
Type.create(link: "Люкс", description: "Номер «Люкс» состоит из двух раздельных комнат – гостиной и спальни, ванной комнаты и гостевого туалета. В номере мягкая мебель, мини - холодильник, просторный гардероб",
             price: 7900, quantity: 2)
Type.create(link: "Повышенной комфортности одноместный", description: "Однокомнатный одноместный номер, оснащенный современной удобной мебелью. Тщательно подобранный интерьер создает атмосферу уюта и комфорта для плодотворной работы или беспечного отдыха.",
             price: 3800, quantity: 1)
Type.create(link: "Повышенной комфортности двухместный", description: "Однокомнатный двухместный номер, оснащенный современной удобной мебелью. Тщательно подобранный интерьер создает атмосферу уюта и комфорта для плодотворной работы или беспечного отдыха.",
             price: 4500, quantity: 2)
Type.create(link: "Президентский", description: "Полностью обновленный комфортабельный двухкомнатный номер состоит из гостиной, спальни, ванной комнаты и гостевого туалета. Расположение номера позволяет любоваться видами города, открывающимися в разных направлениях.",
             price: 9570, quantity: 1)
Type.create(link: "Семейный", description: "Апартаменты это роскошный комфортабельный двухкомнатный номер, состоящий из гостиной, спальни, ванной комнаты и гостевого туалета. Из окон номера открывается завораживающий вид на город.",
             price: 6900, quantity: 3)
Type.create(link: "Стандартный двухместный", description: "Уютный однокомнатный двухместный номер. В номере универсальный стол, зеркало, журнальный стол, телефон, телевизор.",
             price: 3650, quantity: 2)
Type.create(link: "Стандартный одноместный", description: "Уютный однокомнатный одноместный номер. В номере универсальный стол, зеркало, журнальный стол, телефон, телевизор.",
             price: 2950, quantity: 1)
arr = ["Апартаменты", "Бизнес", "Большой семейный", "Люкс", "Повышенной комфортности одноместный", "Повышенной комфортности двухместный", "Президентский", "Семейный", "Стандартный двухместный", "Стандартный одноместный" ]

#Create Rooms model
for i in 1..200
 Room.create(number: i, type: Type.find_by_link(arr[(rand(0..9))]))
end
#Create Eating model
Eating.create(description: 'Все включено', price: 1000)
Eating.create(description: 'Шведский стол включен, бар платный', price: 900)
Eating.create(description: 'Обед, ужин и напитки включены', price: 800)
Eating.create(description: 'Обед и ужин включены, бар платный', price: 700)
Eating.create(description: 'Завтрак, ужин и напитки включены', price: 600)
Eating.create(description: 'Завтрак и ужин включены, бар платный', price: 500)
Eating.create(description: 'Завтрак, обед и напитки включены', price: 400)
Eating.create(description: 'Завтрак и напитки включены', price: 300)
Eating.create(description: 'Завтрак включен, бар платный', price: 200)
Eating.create(description: 'Включены только напитки', price: 100)
User.create(email: 'admin@admin.ru', password: 'yaadmin', admin: true, name: 'admin')

100000.times do
  User.create(name: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password(min_length:6))
end