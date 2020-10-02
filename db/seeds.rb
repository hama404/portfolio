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


## 4/4 SEASONS COFFEE
# Parlors, Adresses
parlor = cat.parlors.new(
  name: '4/4 SEASONS COFFEE',
  url: 'http://allseasonscoffee.jp/',
  insta: 'https://www.instagram.com/allseasonscoffee/')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: '4/4 SEASONS COFFEE',
  address1: '新宿2-7-7',
  city: '新宿区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1600022,
  telephone: "03-5341-4273")
address.parlor.stores += 1
address.save!

# Assets
first = 'c3c3b192-315d-4185-bc83-6894085fca6b_m.jpg'
dir = 'app/assets/images/parlors/all_seasons_coffee/'

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
weekdays = "1 2 3 4 5"
holidays = "0 6"

weekdays.split.each do |wday|
  bh_weekdays = address.business_hours.new(
    wday: wday,
    open: 8.5,
    close: 20.0)
  bh_weekdays.save!

  bh_weekdays.crowdeds.create!(
    hourly_time: 9.0,
    percent: 10)
  bh_weekdays.crowdeds.create!(
    hourly_time: 10.0,
    percent: 40)
  bh_weekdays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 80)
  bh_weekdays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 30)
  bh_weekdays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 10)
  bh_weekdays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 30)
  bh_weekdays.crowdeds.create!(
    hourly_time: 20.0,
    percent: 20)
end

holidays.split.each do |wday|
  bh_holidays = address.business_hours.new(
    wday: wday,
    open: 10.0,
    close: 19.0)
  bh_holidays.save!

  bh_holidays.crowdeds.create!(
    hourly_time: 10.0,
    percent: 20)
  bh_holidays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 60)
  bh_holidays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 80)
  bh_holidays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 30)
  bh_holidays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 10)
  bh_holidays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 20)
end


## PEANUTS Cafe
# Parlors, Adresses
parlor = cat.parlors.new(
  name: 'PEANUTS Cafe',
  url: 'http://www.peanutscafe.jp/',
  insta: 'https://www.instagram.com/peanutscafe_tokyo/')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: 'PEANUTS Cafe',
  address1: '青葉台2-16-7',
  city: '目黒区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1530042,
  telephone: "03-6452-5882")
address.parlor.stores += 1
address.save!

# Assets
first = '494f8124-8516-41c2-b139-6252c8aa0dd0_m.jpg'
dir = 'app/assets/images/parlors/peanuts_cafe/'

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
    open: 10.0,
    close: 22.0)
  bh_wdays.save!

  bh_wdays.crowdeds.create!(
    hourly_time: 10.0,
    percent: 20)
  bh_wdays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 40)
  bh_wdays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 90)
  bh_wdays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 40)
  bh_wdays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 30)
  bh_wdays.crowdeds.create!(
    hourly_time: 15.0,
    percent: 30)
  bh_wdays.crowdeds.create!(
    hourly_time: 16.0,
    percent: 10)
  bh_wdays.crowdeds.create!(
    hourly_time: 18.0,
    percent: 20)
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


## Satén japanese tea
# Parlors, Adresses
parlor = cat.parlors.new(
  name: 'Satén japanese tea',
  url: 'https://saten.jp/',
  insta: 'https://www.instagram.com/saten_jp/?hl=ja')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: 'Satén japanese tea',
  address1: '松庵3-25-9',
  address2: 'ロアジール松庵',
  city: '杉並区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1670054,
  telephone: "03-6754-8866")
address.parlor.stores += 1
address.save!

# Assets
first = 'c52708cd-d295-49ba-83db-8137b87e8a0d_m.jpg'
dir = 'app/assets/images/parlors/saten/'

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
wdays = "0 2 3 4 6"
fri = "5"

wdays.split.each do |wday|
  bh_wdays = address.business_hours.new(
    wday: wday,
    open: 10.0,
    close: 21.0)
  bh_wdays.save!

  bh_wdays.crowdeds.create!(
    hourly_time: 10.0,
    percent: 20)
  bh_wdays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 30)
  bh_wdays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 70)
  bh_wdays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 80)
  bh_wdays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 70)
  bh_wdays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 50)
  bh_wdays.crowdeds.create!(
    hourly_time: 20.0,
    percent: 40)
  bh_wdays.crowdeds.create!(
    hourly_time: 21.0,
    percent: 30)
end

fri.split.each do |wday|
  bh_fri = address.business_hours.new(
    wday: wday,
    open: 10.0,
    close: 23.0)
  bh_fri.save!

  bh_fri.crowdeds.create!(
    hourly_time: 10.0,
    percent: 40)
  bh_fri.crowdeds.create!(
    hourly_time: 11.0,
    percent: 50)
  bh_fri.crowdeds.create!(
    hourly_time: 12.0,
    percent: 60)
  bh_fri.crowdeds.create!(
    hourly_time: 13.0,
    percent: 70)
  bh_fri.crowdeds.create!(
    hourly_time: 14.0,
    percent: 60)
  bh_fri.crowdeds.create!(
    hourly_time: 19.0,
    percent: 20)
  bh_fri.crowdeds.create!(
    hourly_time: 20.0,
    percent: 30)
  bh_fri.crowdeds.create!(
    hourly_time: 21.0,
    percent: 40)
  bh_fri.crowdeds.create!(
    hourly_time: 22.0,
    percent: 40)
  bh_fri.crowdeds.create!(
    hourly_time: 23.0,
    percent: 40)
end


## はちくまカフェ
# Parlors, Adresses
parlor = cat.parlors.new(
  name: 'はちくまカフェ',
  insta: 'https://www.instagram.com/hachikumacafe/')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: 'はちくまカフェ',
  address1: '東池袋3-11-3',
  address2: 'ハッケンハセガワビル1階',
  city: '豊島区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1700013,
  telephone: "0359448924")
address.parlor.stores += 1
address.save!

# Assets
first = 'aef3b38e-526c-4c62-a840-1e3ebcc571ff_m.jpg'
dir = 'app/assets/images/parlors/hachikuma/'

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
weekdays = "1 2 3 4 5"
holidays = "0 6"

weekdays.split.each do |wday|
  bh_weekdays = address.business_hours.new(
    wday: wday,
    open: 11.5,
    close: 19.5)
  bh_weekdays.save!

  bh_weekdays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 80)
  bh_weekdays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 70)
  bh_weekdays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 15.0,
    percent: 70)
  bh_weekdays.crowdeds.create!(
    hourly_time: 16.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 17.0,
    percent: 50)
  bh_weekdays.crowdeds.create!(
    hourly_time: 18.0,
    percent: 30)
  bh_weekdays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 10)
end

holidays.split.each do |wday|
  bh_holidays = address.business_hours.new(
    wday: wday,
    open: 11.0,
    close: 19.5)
  bh_holidays.save!

  bh_holidays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 70)
  bh_holidays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 80)
  bh_holidays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 70)
  bh_holidays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 60)
  bh_holidays.crowdeds.create!(
    hourly_time: 15.0,
    percent: 70)
  bh_holidays.crowdeds.create!(
    hourly_time: 16.0,
    percent: 60)
  bh_holidays.crowdeds.create!(
    hourly_time: 17.0,
    percent: 50)
  bh_holidays.crowdeds.create!(
    hourly_time: 18.0,
    percent: 20)
  bh_holidays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 10)
end


## DIXANS
# Parlors, Adresses
parlor = cat.parlors.new(
  name: 'DIXANS',
  url: 'http://www.dixans.jp/',
  insta: 'https://www.instagram.com/dixans.jimbocho/?hl=ja')
parlor.save!
parlor.assets.create!

address = parlor.addresses.new(
  name: 'DIXANS JIMBOCHO',
  address1: '神田神保町1-24',
  address2: '1F・2階',
  city: '千代田区',
  state: '東京都',
  prefecture_code: 13,
  zipcode: 1010051,
  telephone: "0352445618")
address.parlor.stores += 1
address.save!

# Assets
first = '5f218a39-0385-4bc7-a575-7dce3221fd3d_m.jpg'
dir = 'app/assets/images/parlors/dixans/'

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
weekdays = "1 2 3 4 5"
holidays = "0 6"

weekdays.split.each do |wday|
  bh_weekdays = address.business_hours.new(
    wday: wday,
    open: 8.0,
    close: 19.0)
  bh_weekdays.save!

  bh_weekdays.crowdeds.create!(
    hourly_time: 8.0,
    percent: 50)
  bh_weekdays.crowdeds.create!(
    hourly_time: 9.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 10.0,
    percent: 40)
  bh_weekdays.crowdeds.create!(
    hourly_time: 11.0,
    percent: 40)
  bh_weekdays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 70)
  bh_weekdays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 80)
  bh_weekdays.crowdeds.create!(
    hourly_time: 15.0,
    percent: 70)
  bh_weekdays.crowdeds.create!(
    hourly_time: 16.0,
    percent: 60)
  bh_weekdays.crowdeds.create!(
    hourly_time: 17.0,
    percent: 40)
  bh_weekdays.crowdeds.create!(
    hourly_time: 18.0,
    percent: 30)
  bh_weekdays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 20)
end

holidays.split.each do |wday|
  bh_holidays = address.business_hours.new(
    wday: wday,
    open: 12.0,
    close: 17.0)
  bh_holidays.save!

  bh_holidays.crowdeds.create!(
    hourly_time: 12.0,
    percent: 70)
  bh_holidays.crowdeds.create!(
    hourly_time: 13.0,
    percent: 80)
  bh_holidays.crowdeds.create!(
    hourly_time: 14.0,
    percent: 70)
  bh_holidays.crowdeds.create!(
    hourly_time: 15.0,
    percent: 60)
  bh_holidays.crowdeds.create!(
    hourly_time: 16.0,
    percent: 50)
  bh_holidays.crowdeds.create!(
    hourly_time: 17.0,
    percent: 40)
  bh_holidays.crowdeds.create!(
    hourly_time: 18.0,
    percent: 30)
  bh_holidays.crowdeds.create!(
    hourly_time: 19.0,
    percent: 20)
end
