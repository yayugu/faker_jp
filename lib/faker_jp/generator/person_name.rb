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

      def gen(sex: :male)
        family_name = @family_names[@bell.rand.to_i]
        i = rand(given_names[sex][:kanji].size)
        FakerJP::Entity::PersonName.new(
          family_name['kanji'], family_name['kana'],
          given_names[sex][:kanji][i], given_names[sex][:kana][i]
        )
      end

      private

      # faker (python) ほとんどそのまま
      #
      # この機能は十分な品質ではありません
      # 改善するcontributeを募集しています
      # - 名前数を増やす
      # - リストを年代別に
      # - 名前ごとに頻度を調整
      # などなど
      def given_names
        {
          female: {
            kanji: [
              '明美', 'あすか',
              '香織', '加奈', 'くみ子',
              'さゆり',
              '千代', '知実',
              '直子', '七夏',
              '花子', '春香',
              '真綾', '舞', '幹', '桃子',
              '結衣', '陽子', '裕美子',
              '里佳',
            ],
            kana: [
              'アケミ', 'アスカ',
              'カオリ', 'カナ', 'クミコ',
              'サユリ',
              'チヨ', 'トモミ',
              'ナオコ', 'ナナカ',
              'ハナコ', 'ハルカ',
              'マアヤ', 'マイ', 'ミキ', 'モモコ',
              'ユイ', 'ヨウコ', 'ユミコ',
              'リカ',
            ],
          },
          male: {
            kanji: [
              '晃', '篤司', '治',
              '京助', '健一',
              '淳', '聡太郎',
              '太一', '太郎', '拓真', '翼', '智也',
              '直樹', '直人',
              '英樹', '浩',
              '学', '充', '稔', '裕樹',
              '裕太', '康弘', '陽一', '洋介',
              '亮介', '涼平',
            ],
            kana: [
              'アキラ', 'アツシ', 'オサム',
              'キョウスケ', 'ケンイチ',
              'ジュン', 'ソウタロウ',
              'タイチ', 'タロウ', 'タクマ', 'ツバサ', 'トモヤ',
              'ナオキ', 'ナオト',
              'ヒデキ', 'ヒロシ',
              'マナブ', 'ミツル', 'ミノル', 'ヒロキ',
              'ユウタ', 'ヤスヒロ', 'ヨウイチ', 'ヨウスケ',
              'リョウスケ', 'リョウヘイ',
            ],
          }
        }
      end
    end
  end
end
