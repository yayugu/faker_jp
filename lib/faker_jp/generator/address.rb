require 'csv'

module FakerJP
  module Generator
    class Address
      KEN_ALL_INDEX_ZIPCODE = 2
      KEN_ALL_INDEX_PREF_KANA = 3
      KEN_ALL_INDEX_CITY_KANA = 4
      KEN_ALL_INDEX_TOWN_KANA = 5
      KEN_ALL_INDEX_PREF = 6
      KEN_ALL_INDEX_CITY = 7
      KEN_ALL_INDEX_TOWN = 8

      def initialize
        @ken_all = CSV.read(
          "#{FakerJP::DATA_DIR}/x-ken-all.csv",
          headers: false,
          converters: [],
        )
      end

      # この機能を改善するcontributeを募集しています
      # - 各都道府県・市町村区・地名ごとの人口に応じた出現頻度の調整
      # など
      def gen
        row = @ken_all.sample
        FakerJP::Entity::Address.new(
          row[KEN_ALL_INDEX_ZIPCODE],
          row[KEN_ALL_INDEX_PREF],
          row[KEN_ALL_INDEX_PREF_KANA],
          row[KEN_ALL_INDEX_CITY],
          row[KEN_ALL_INDEX_CITY_KANA],
          row[KEN_ALL_INDEX_TOWN],
          row[KEN_ALL_INDEX_TOWN_KANA],
          '1-1-1',
          '1-1-1',
          '',
          '',
          '',
          '',
        )
      end
    end
  end
end
