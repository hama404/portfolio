# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# coding: utf-8

## Users
user = User.new(
  email: 'example@example.com',
  password: 'test1234')
user.save!

## Categories
cat = Category.new(name: 'cafe')
cat.save!

## Parlors
parlor = Parlor.new(
  name: 'and people',
  category_id: '1',
  url: 'https://www.andpeople.co.jp/')
parlor.save!

## Adresses
adress = parlor.adresses.new(
  name: 'and people ginza',
  parlor_id: '1',
  address1: '銀座6-5-15',
  address2: '銀座能楽堂飯島ビル9F',
  city: '中央区',
  prefecture_code: '',
  zipcode: '1040061',
  telephone: '0335738440')
adress.parlor.stores += 1
adress.save!

## Assets
photo = parlor.assets.new
photo.save!
photo = adress.assets.new
photo.save!
