# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'a@a.aa', password: '12341234')
User.create(email: 'b@b.bb', password: '12341234')
User.create(email: 'c@c.cc', password: '12341234')
Connection.create(user_id_1: User.first.id, user_id_2: User.second.id)
Connection.create(user_id_1: User.first.id, user_id_2: User.third.id)
Connection.create(user_id_1: User.second.id, user_id_2: User.third.id, accepted: true)
