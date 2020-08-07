module ParlorsHelper
  #  parlor/index side_bar
  def pref_name(prefcode)
    JpPrefecture::Prefecture.all[prefcode - 1].name
  end

  def pref_count(prefcode)
    Adress.where(prefecture_code: prefcode).count
  end

  def adress_count(area)
    Adress.where(prefecture_code: area[:prefcode_min]..area[:prefcode_max]).count
  end

  #  parlor/index parlor_list

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
