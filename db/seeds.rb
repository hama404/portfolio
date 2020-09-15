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


## AND PEOPLE
# Parlors, Adresses
parlor = cat.parlors.new(
  name: 'and people',
  url: 'https://www.andpeople.co.jp/')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: 'and people ginza',
  address1: '銀座6-5-15',
  address2: '銀座能楽堂飯島ビル9F',
  city: '中央区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1040061,
  telephone: "033-573-8440")
address.parlor.stores += 1
address.save!

# Assets
first = '96618601.jpg'
dir = 'app/assets/images/parlors/andpeople_ginza/'

address.assets.create!(
  photo: File.new(Rails.root.join(dir,first)))
Dir.each_child dir do |file|
  next if file == first
  path = Rails.root.join(dir,file)
  address.assets.create!(
    photo: File.new(path))
end

# Infomations
address.infos.create!(
  notice: "★★コロナウイルス感染防止のため、当店では下記の対策をとらせて頂いております★★\n・入口でアルコール消毒\n・お客様とスタッフの検温\n・飛沫防止用の透明ビニールの設置\n・席数を通常の7割に\n\n◆and people銀座店は、東京都の要請を受けて、8月3日(月)から時間短縮して営業致します。\n月〜金 17:00~22:00\n土日祝 12:00~22:00\n\n随時ご予約も承っております。\n※営業日や営業時間は、政府からの要請によって変更が生じる場合がございます。予めご了承ください。\n")

# BusinessHours, Crowdeds
weekdays = "1 2 3 4 5"
holidays = "0 6"

weekdays.split.each do |wday|
  bh_weekdays = address.business_hours.new(
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
  bh_holidays = address.business_hours.new(
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


## BUY ME STAND
# Parlors, Adresses
parlor = cat.parlors.new(
  name: 'BUY ME STAND',
  insta: 'https://www.instagram.com/buy_me_stand/')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: 'BUY ME STAND',
  address1: '東1-31-19',
  address2: 'マンション並木橋302',
  city: '渋谷区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1500011,
  telephone: "03-6450-6969")
address.parlor.stores += 1
address.save!

# Assets
first = '383e6b86-3261-4041-ac13-b585c507148b_m.jpg'
dir = 'app/assets/images/parlors/buy_me_stand/'

address.assets.create!(
  photo: File.new(Rails.root.join(dir,first)))
Dir.each_child dir do |file|
  next if file == first
  path = Rails.root.join(dir,file)
  address.assets.create!(
    photo: File.new(path))
end

# Infomations

# BusinessHours, Crowdeds
wdays = "0 1 2 3 4 5 6"

wdays.split.each do |wday|
  bh_wdays = address.business_hours.new(
    wday: wday,
    open: 8.0,
    close: 22.0)
  bh_wdays.save!

  bh_wdays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 50)
  bh_wdays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 80)
  bh_wdays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 60)
  bh_wdays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 40)
  bh_wdays.crowdeds.create!(
    hourly_time: 20.0,
    percent: 80)
  bh_wdays.crowdeds.create!(
    hourly_time: 21.0,
    percent: 30)
  bh_wdays.crowdeds.create!(
    hourly_time: 22.0,
    percent: 10)
end
