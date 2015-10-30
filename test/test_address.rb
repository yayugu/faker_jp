require 'minitest/autorun'
require 'bundler'
Bundler.require
$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'faker_jp'

describe 'address' do
  describe 'generator' do
    it 'should generate entity' do
      f = FakerJP::Generator::Address.new
      e = f.gen
      assert_kind_of FakerJP::Entity::Address, e
      100.times do
        p e = f.gen
      end
    end
  end
end
