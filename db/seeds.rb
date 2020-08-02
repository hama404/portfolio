# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

## Users
user = User.new(
  email: 'example@example.com',
  password: 'test1234')
user.save!

## Shops
