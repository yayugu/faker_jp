require 'faker_jp/entity/address'
require 'faker_jp/entity/person_name'
require 'faker_jp/generator/address'
require 'faker_jp/generator/person_name'

module FakerJP
  DATA_DIR = File.absolute_path(File.dirname(File.dirname(__FILE__))) + '/data'
end
