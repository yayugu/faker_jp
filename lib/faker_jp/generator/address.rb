
module FakerJP
  module Generator
    class Address
      def initialize
      end

      # この機能を改善するcontributeを募集しています
      # - 各都道府県・市町村区・地名ごとの人口に応じた出現頻度の調整
      # など
      def gen(sex: :male)
        FakerJP::Entity::Address.new(
        )
      end
    end
  end
end
