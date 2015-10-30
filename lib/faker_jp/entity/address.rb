module FakerJP
  module Entity
    class Address < Struct.new(:zipcode, :prefecture, :prefecture_kana, :city, :city_kana, :town, :town_kana, :banchi, :banchi_kana, :building, :building_kana, :room, :room_kana)
    end
  end
end
