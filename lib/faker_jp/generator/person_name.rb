module FakerJP
  module Generator
    class PersonName
      def initialize
        fp = open("#{FakerJP::DATA_DIR}/family_name.json")
        @family_names = JSON.load(fp)
        fp.close

        # normally distribution
        # 標準偏差の200 は感覚で決めた値
        # 人口の68%をカバーする名字の数が実際にどのくらいなのかは不明
        @bell = RandomBell.new(mu: 0, sigma: 200, range: 0...(@family_names.size - 1))
      end

      def gen
        family_name = @family_names[@bell.rand.to_i]
        FakerJP::Entity::PersonName.new(family_name['kanji'], family_name['kana'], '太郎', 'たろう')
      end
    end
  end
end
