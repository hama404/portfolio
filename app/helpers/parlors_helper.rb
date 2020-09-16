module ParlorsHelper
  #  parlor/index parlor_list
  #  parlor/show single_parlor
  def detail(store, key: nil)
    detail = {}

    if store.prefecture_code.present? && store.zipcode_jp.present?
      display = "#{store.zipcode_jp} #{store.address}"
      return display if key == "address"
      detail[:ADDRESS] = { tag: "p", body: [display] }
    end
    return if key == "address"

    if store.telephone.present?
      return store.telephone if key == "telephone"
      detail[:TEL] = { tag: "p", body: [store.telephone] }
    end
    return store.telephone if key == "telephone"

    if store.parlor.url.present?
      return store.parlor.url if key == "url"
      detail[:HP] = { tag: "a", body: [store.parlor.url] }
    end
    return store.parlor.url if key == "url"

    if store.parlor.insta.present?
      return store.parlor.insta if key == "insta"
      detail[:insta] = { tag: "a", body: [store.parlor.insta] }
    end
    return store.parlor.insta if key == "insta"

    detail["営業時間、定休日、LO"] = { tag: "div", body: [] }
    detail["お知らせ"] = { tag: "div", body: store.news }

    detail
  end

  def data_set(store)
    return { labels: 0, data: 0 } if store.business_hours.blank?
    labels = []
    data = []
    wday = Time.zone.now.wday
    bh_today = store.business_hours.find_by(wday: wday)
    open = bh_today.open
    close = bh_today.close

    labels << open.floor - 1
    open.floor.upto close.ceil do |time|
      crowded = bh_today.crowdeds.find_by(hourly_time: time.to_f)
      percent = crowded ? crowded.percent : 0
      labels << time
      data << { x: time.to_f, y: percent }
    end
    labels << close.ceil + 1

    { labels: labels, data: data }
  end

  #  parlor/index side_bar
  def pref_name(prefcode)
    JpPrefecture::Prefecture.all[prefcode - 1].name
  end

  def pref_count(prefcode)
    Address.where(prefecture_code: prefcode).count
  end

  def adress_count(area)
    Address.where(prefecture_code: area[:prefcode_min]..area[:prefcode_max]).count
  end

  #  JpPrefecture
  def rigions
    #      rigions.each do |key, value|
    #        p value[:name]
    #        value[:prefcode_min].upto value[:prefcode_max] do |num|
    #          p pref_name(num)
    #          p pref_count(num)
    #        end
    #      end
    {
      area1: {
        name: "北海道・東北",
        area: ["北海道", "東北"],
        prefcode_min: 1,
        prefcode_max: 7,
      },
      area2: {
        name: "関東",
        area: "関東",
        prefcode_min: 8,
        prefcode_max: 14,
      },
      area3: {
        name: "中部",
        area: "中部",
        prefcode_min: 15,
        prefcode_max: 23,
      },
      area4: {
        name: "関西",
        area: "関西",
        prefcode_min: 24,
        prefcode_max: 30,
      },
      area5: {
        name: "中国",
        area: "中国",
        prefcode_min: 31,
        prefcode_max: 35,
      },
      area6: {
        name: "四国",
        area: "四国",
        prefcode_min: 36,
        prefcode_max: 39,
      },
      area7: {
        name: "九州",
        area: "九州",
        prefcode_min: 40,
        prefcode_max: 47,
      },
    }
  end
end
