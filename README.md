# SAKELIKE

## サービス概要
![Test Image 1](https://user-images.githubusercontent.com/74159284/115142093-c797ca00-a07a-11eb-9d98-caba0e1461a5.png "SAKELIKE")

日本酒ほど、生産地の米や麹、熟成、火入れにより様々な味わいを表現できる酒はそう無いと思います。それぞれの酒蔵によって全く異なる日本酒をの中からそれぞれの方が求める最高の日本酒を見つけられるように、という思いからこのアプリを作りました。

「SAKELIKE」は、レビュー、ブックマーク、ランキング、検索などの機能を活用し、あなたの日本酒探しを効率的にし、手助けできるものになるように、日々改良を重ねております

## 開発中に意識した事
MVCアーキテクチャの仕組みに従い、基本を意識した構成を心掛けております。
ユーザーの目線に立ち、サービスを運営する上で必要な機能は何かを考え、機能を実装してきました。

## 取り入れた機能
admin状態のユーザーだけがアクセスできる管理画面
各種APIを利用した機能（ソーシャルログインやGoogleマップなど）
CI/CDツールを使った自動テスト＆自動デプロイ

他にも、GitHubの機能を活用し、「branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」という流れでチーム開発を想定し開発を進めました。

## ER図

## 各種機能＆導入技術
* Basic認証
* API:Googleマップ
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

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
