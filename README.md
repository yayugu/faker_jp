## about
日本に特化した擬似個人情報生成ツールです。

## 方針
- できる限り本物らしいデータを生成する
- とはいえ本物らしくないデータになってしまうとしても生成ないよりできたほうが良い

## 現在生成できる情報
- いい感じ
 - 名字(7000件・出現頻度考慮)
- それなり
 - 住所(日本郵便の郵便番号データをベースに生成。分布はランダムで人口など考慮されていない)
 - 性別
 - 電話番号(携帯電話のみ)
- 一応生成できる
 - 名前

## 利用させていただいているデータ元
- 名字由来net http://myoji-yurai.net/prefectureRanking.htm
- faker (Ruby) https://github.com/stympy/faker
- faker (Python) https://github.com/joke2k/faker
- x-ken-all https://github.com/sanemat/x-ken-all
