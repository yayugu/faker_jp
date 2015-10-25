module FakerJP
  module Entity
    class PersonName < Struct.new(:family_kanji, :family_kana, :given_kanji, :given_kana)
    end
  end
end
