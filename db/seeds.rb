# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({name: "super"})
r2 = Role.create({name: "admin"})
r3 = Role.create({name: "staff"})
r4 = Role.create({name: "student"})
r5 = Role.create({name: "guardian"})

u1 = User.create({email: "latiftanga@gmail.com", password: "b7ye6z9h5", role_id: r1.id})
u2 = User.create({email: "admin@example.com", password: "admin123", role_id: r2.id})
u3 = User.create({email: "staff@example.com", password: "staff123", role_id: r3.id})
u4 = User.create({email: "student@example.com", password: "student", role_id: r4.id})
u5 = User.create({email: "guardian@example.com", password: "guardian", role_id: r5.id})
