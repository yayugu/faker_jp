require 'bundler'
Bundler.require
require_relative '../lib/faker_jp'
require_relative '../lib/faker_jp/fetch_data/family_name'

desc 'fetch family name data'
task :fetch_family_name do
  FakerJP::FetchData::FamilyName.new.fetch
end
