require 'minitest/autorun'
require 'bundler'
Bundler.require
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'faker_jp'

describe 'family name' do
  describe 'generator' do
    it 'should generate entity' do
      f = FakerJP::Generator::PersonName.new
      e = f.gen
      assert_kind_of FakerJP::Entity::PersonName, e
      refute_empty e.family_kanji
      refute_empty e.family_kana
      refute_empty e.given_kanji
      refute_empty e.given_kana
      100.times do
        p e = f.gen
      end
    end
  end
end
