# README

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
- belongs_to :item

## favoritesテーブル
|Column|Type      |Options          |
|------|--------- |-----------------|
|user  |references|foreign_key: true|
|item  |references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
