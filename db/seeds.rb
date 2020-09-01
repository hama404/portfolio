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


## and people
# Parlors, Adresses
parlor = Parlor.new(
  name: 'and people',
  category_id: 1,
  url: 'https://www.andpeople.co.jp/')
parlor.save!
parlor.assets.create!

adress = parlor.adresses.new(
  name: 'and people ginza',
  parlor_id: 1,
  address1: '銀座6-5-15',
  address2: '銀座能楽堂飯島ビル9F',
  city: '中央区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1040061,
  telephone: "033-573-8440")
adress.parlor.stores += 1
adress.save!

# Assets
first = '96618601.jpg'
dir = 'app/assets/images/parlors/andpeople_ginza/'

adress.assets.create!(
  photo: File.new(Rails.root.join(dir,first)))
Dir.each_child dir do |file|
  next if file == first
  path = Rails.root.join(dir,file)
  adress.assets.create!(
    photo: File.new(path))
end

# BusinessHours, Crowdeds
weekdays = "1 2 3 4 5"
holidays = "0 6"

weekdays.split.each do |wday|
  bh_weekdays = adress.business_hours.new(
    wday: wday,
    open: 17.0,
    close: 23.5,
    last_order: 23.0)
  bh_weekdays.save!

  bh_weekdays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 40)
  bh_weekdays.crowdeds.create!(
    hourly_time: 20.0,
    percent: 80)
  bh_weekdays.crowdeds.create!(
    hourly_time: 21.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 22.0,
    percent: 10)
end

holidays.split.each do |wday|
  bh_holidays = adress.business_hours.new(
    wday: wday,
    open: 17.0,
    close: 23.5,
    last_order: 23.0)
  bh_holidays.save!

  bh_holidays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 40)
  bh_holidays.crowdeds.create!(
    hourly_time: 20.0,
    percent: 80)
  bh_holidays.crowdeds.create!(
    hourly_time: 21.0,
    percent: 60)
  bh_holidays.crowdeds.create!(
    hourly_time: 22.0,
    percent: 10)
end
