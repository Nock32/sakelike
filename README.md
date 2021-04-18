# SAKELIKE

## サービス概要
![Test Image 1](https://user-images.githubusercontent.com/74159284/115142093-c797ca00-a07a-11eb-9d98-caba0e1461a5.png "SAKELIKE")

ラーメンほど奥深い食べ物はそうそうありません。お店によって全く異なる顔を見せてくれるラーメンをめぐる日々は、まさに冒険（quest）そのものとだと私は考えています。

「Ramen Quest」は、レビュー、ブックマーク、ランキング、カレンダーなどの機能を活用し、日々のラーメン巡りを効率的に記録するためのWEBサービス。

コツコツと積み重ねた結果を可視化し、それらをユーザー間で情報共有する事でラーメン好きにありがちな「承認欲求（ラーメン通である事に対する誇り）」の実現を目指します。



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
