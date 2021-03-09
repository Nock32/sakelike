# README

## usersテーブル
|Column            |Type     |Options                 |
|----------------- |---------|------------------------|
|nickname          |string   |null: false             |
|email             |string   |null: false,unique: true|
|encrypted_password|string   |null: false             |
|family_name       |string   |null: false             |
|first_name        |string   |null: false             |
|family_nameKana   |string   |null: false             |
|first_nameKana    |string   |null: false             |
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
|brewer_name         |string    |null: false      |
|brewer_address      |string    |null: false      |
|brewer_area id      |integer   |null: false      |
### Association
- belongs_to :user
- has_many   :comments
- has_many   :favorite

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
