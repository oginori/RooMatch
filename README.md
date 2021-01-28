# README

# 「RooMatch」

## 概要
「自分好みの部屋にしたい」「でもコーディネートするのがめんどくさい」という住人(resident)と
「インテリアをコーディネートするのが好き」「将来インテリアコーディネーターになりたい」という
コーディネーター(coordinator)をマッチングさせ、住人の部屋に合ったインテリアをコーディネーターに
提案してもらいます。

## コンセプト
気軽に部屋のコーディネートをしてもらう&してあげる相手を探すマッチングアプリ

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 機能一覧
- [ ] 会員登録機能（住民、コーディネーター各々）
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] 退会機能
  - [ ] 各々のマイページ、住民のリクエスト、コーディネーターのデザイン画像も削除
- [ ] ログイン機能
- [ ] パスワード再設定機能
- [ ] インテリア一覧表示機能
  - [ ] ページネーション（スクロール）
  - [ ] お気に入り数を表示
  - [ ] タグ検索
- [ ] タグ付け機能
  - [ ] インテリアデザインに5個、住人及びコーディネーターは3個まで登録可能
- [ ] インテリアデザイン一括削除機能
  - [ ] コーディネーターがアップロードしたデザイン画像を自身のもののみ一括削除可能
- [ ] インテリアデザインお気に入り機能
- [ ] コーディネーターフォロー機能
  - [ ] 住民のみコーディネーターのフォローが可能
- [ ] リクエスト投稿機能
  - [ ] 間取りや部屋の画像アップロード
- [ ] チャット機能
  - [ ] 取引成立した住民とコーディネーターのみチャット可能
- [ ] 依頼機能
- [ ] 立候補機能
- [ ] 承諾機能
- [ ] 任命機能
  - [ ] 住人及びコーディネーターは1つの期間に1取引のみしかできない
- [ ] 評価機能
- [ ] インテリアデザイン提案機能
  - [ ] デザイン画像のアップロード


## カタログ設計
https://docs.google.com/spreadsheets/d/1hbxkYNR8utLknCaf41QdGZTeYAzPInPiJsmd7Q26AWQ/edit?usp=sharing


## テーブル定義
https://docs.google.com/spreadsheets/d/1hbxkYNR8utLknCaf41QdGZTeYAzPInPiJsmd7Q26AWQ/edit?usp=sharing

## ER図
https://drive.google.com/file/d/1yfzyqErxPW_wj_9O9nrBwIVE8VlWD2kl/view?usp=sharing

## 画面遷移図
https://cacoo.com/diagrams/svNIPY5kKlNaGMvD/F0255


## 画面ワイヤーフレーム
https://drive.google.com/file/d/1OwYT0kMVNzZ2oUrrhSCFAN6x4QI-1cIl/view?usp=sharing
https://drive.google.com/file/d/1a88GUvFdfYkR3NECT83rBaBcNJPJMORd/view?usp=sharing


## 使用予定Gem
* carrierwave
* mini_magick
* devise
* kaminari

