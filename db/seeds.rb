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
  category_id: 1,
  url: 'https://www.andpeople.co.jp/')
parlor.save!

## Adresses
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

## Assets
image = parlor.assets.new
image.save!

dir = 'app/assets/images/parlors/andpeople_ginza/'
Dir.each_child dir do |file|
  path = Rails.root.join(dir,file)
  image = adress.assets.new(
    photo: File.new(path))
  image.save!
end

## BusinessHours, Crowdeds
weekdays = "1 2 3 4 5"
holidays = "0 6"

weekdays.split.each do |wday|
  bh_weekdays = BusinessHour.new(
    parlor_id: 1,
    wday: wday,
    open: 17.0,
    close: 23.5,
    last_order: 23.0,
    open_crowded: 20,
    close_crowded: 20)
  bh_weekdays.save!

  crowded = Crowded.new(
    hourly_time: 20.0,
    percent: 80)
  crowded.business_hour = bh_weekdays
  crowded.save!
end

holidays.split.each do |wday|
  bh_holidays = BusinessHour.new(
    parlor_id: 1,
    wday: wday,
    open: 12.0,
    close: 23.5,
    last_order: 23.0,
    open_crowded: 20,
    close_crowded: 20)
  bh_holidays.save!

  crowded = Crowded.new(
    hourly_time: 20.0,
    percent: 80)
  crowded.business_hour = bh_holidays
  crowded.save!
end
