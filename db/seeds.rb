# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    User.create!(email: 'marc@webmastr.com', password: '123456', auth_token: 'abc123tokenbtwyz') 
    User.create!(email: 'pamela@test.com', password: '123456', auth_token: 'abcXYZ1bsk456789')