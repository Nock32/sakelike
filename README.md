# SAKELIKE

[![CircleCI](https://circleci.com/gh/Nock32/sakelike.svg?style=shield)](https://app.circleci.com/pipelines/github/Nock32/sakelike)

## サービスの概要
![Test Image 1](https://user-images.githubusercontent.com/74159284/117315840-07f0a800-aec3-11eb-9ce7-82eba241bbaf.png "SAKELIKE")

日本酒ほど、生産地の米や麹、熟成、火入れにより様々な味わいを表現できる酒はそう無いと思います。それぞれの酒蔵によって異なる日本酒の中からそれぞれの人が求める最高の日本酒を見つけられるように、という思いで開発しました。

「SAKELIKE」は、レビューや検索などの機能を導入し、ユーザーの日本酒探しを効率的に手助けできるようにするため、日々改良を重ねております。

## 開発中に意識した事
MVCアーキテクチャの仕組みに従い、基本を意識した構成を心掛けております。
ユーザーの目線に立ち、サービスを運営する上で必要な機能は何かを考え、機能を実装してきました。
また、GitHubの機能を活用し、「branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」という流れでチーム開発を想定し開発を進めました。

## デプロイ先URL
[EC2デプロイ先リンク](http://35.73.34.160/ "SAKELIKE")

* basic認証用ID/Pass
  * ID: admin
  * Pass: 2222
* テストログインアカウント情報
  * Email：a@ooooo.co.jp
  * Password：aaa000

## 開発環境
* Ruby 2.6.6
* Rails 6.1.3.1

## 各種機能＆導入技術
* CSSフレームワーク：Bootstrap5
* データベース：MySQL
* ユーザー登録＆ログイン：devise
* Basic認証
* デプロイプラットフォーム：AWS EC2
* テスト：RSpec、Capybara、factory_bot
* 自動テスト＆自動デプロイ：Circleci、Capistrano
* コードチェック：Rubocop
* 画像アップロード、保管：mini_magick、AWS S3
* パンくずリスト：breadcrumbs_on_rails
* 検索：ransack
* コンテナ仮想化ツール：Docker


# DB設計
## usersテーブル
|Column            |Type     |Options                 |
|----------------- |---------|------------------------|
|nickname          |string   |null: false             |
|email             |string   |null: false,unique: true|
|encrypted_password|string   |null: false             |
|family_name       |string   |null: false             |
|first_name        |string   |null: false             |
|family_name_kana  |string   |null: false             |
|first_name_kana   |string   |null: false             |
|birthday          |date     |null: false             |
### Association
- has_many :comments
- has_many :favorite
- has_many :items
- has_many :brewer

## itemsテーブル
|Column              |Type      |Options          |
|--------------------|----------|-----------------|
|name                |string    |null: false      |
|explanation         |text      |null: false      |
### Association
- belongs_to :user
- belongs_to :brewer
- has_many   :comments
- has_many   :favorite

## brewersテーブル
|Column              |Type      |Options          |
|--------------------|----------|-----------------|
|name                |string    |null: false      |
|explanation         |text      |null: false      |
|address             |string    |null: false      |
|area_id             |integer   |null: false      |
### Association
- belongs_to :user
- has_many   :items

## commentsテーブル
|Column|Type      |Options          |
|------|----------|-----------------|
|text  |text      |null: false      |
|user  |references|foreign_key: true|
|item  |references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brewer

## reviewsテーブル
|Column|Type      |Options          |
|------|----------|-----------------|
|text  |text      |null: false      |
|user  |references|foreign_key: true|
|item  |references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル
|Column|Type      |Options          |
|------|--------- |-----------------|
|user  |references|foreign_key: true|
|item  |references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
