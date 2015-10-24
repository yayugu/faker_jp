module FakerJP
  module FetchData

    # fetch data form http://myoji-yurai.net/prefectureRanking.htm
    class FamilyName
      INTERVAL = 5

      def initialize
        @a = Mechanize.new
      end

      def fetch

        File.write("#{FakerJP::DATA_DIR}/family_name.json", 'a')
        names = fetch_pages
        File.write('../../data/family_name.json', JSON.generate(names))
      end

      private

      def fetch_pages
        names = []
        url_list.each do |url|
          page = @a.get(url)
          sleep INTERVAL
          tables = page.parser.css('table')
          names += parse_table(tables[9]).compact # 9, 10あたりに本体データがある
          names += parse_table(tables[10]).compact
          break
        end
        names
      end

      def parse_table(table)
        table.css('a').map do |a|
          name = a.text
          begin
            kana = fetch_detail_page_and_get_kana(a['href'])
            {kanji: name, kana: kana}
          rescue => e
            puts e
            puts "error: name #{name}"
            nil
          end
        end
      end

      def fetch_detail_page_and_get_kana(url)
        page = @a.get(url)
        sleep INTERVAL
        t = page.parser.css('p.meta')[0].text # このあたりに かなデータ
        t.match(/^【読み】(.*?)(?:,|$)/)[1]
      end

      def url_list
        %w(
          http://myoji-yurai.net/prefectureRanking.htm
          http://myoji-yurai.net/prefectureRanking500.htm?pref=0
          http://myoji-yurai.net/prefectureRanking1000.htm?pref=0
          http://myoji-yurai.net/prefectureRanking1500.htm?pref=0
          http://myoji-yurai.net/prefectureRanking2000.htm?pref=0
          http://myoji-yurai.net/prefectureRanking2500.htm?pref=0
          http://myoji-yurai.net/prefectureRanking3000.htm?pref=0
          http://myoji-yurai.net/prefectureRanking3500.htm?pref=0
          http://myoji-yurai.net/prefectureRanking4000.htm?pref=0
        )
      end
    end
  end
end
