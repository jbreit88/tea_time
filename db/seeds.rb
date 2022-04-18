# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_1 = Customer.create!(first_name: 'Mel', last_name: 'Gibson', email: 'mel@gibson.com', address: '1234 Hollywood St., Los Angeles, CA, 11111')

tea_1 = Tea.create!(title: 'Earl Grey', description: 'This tea is delicious. Full of caffeine. Good for waking up in the morning.', temperature: 180, brew_time: 180)
