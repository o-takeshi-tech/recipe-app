# RecipeRator

# 概要

* ユーザー登録・ログイン機能
* 食材登録機能
* 食品レシピ登録・削除・編集機能
* 食品レシピ検索機能

# 本番環境

http://52.68.31.63/


# 制作背景

## きっかけ
友人が冷蔵庫にある食材を検索するだけでレシピが出てくるようなアプリをつくってほしいとつたえられたこと

## 解決したい課題
レシピを考えることがめんどくさい時にある食材でレシピを探せること

# DEMO
[RecipeRatorデモ](https://gyazo.com/f5131d3686663d096307c71b196023ef)

# 工夫したポイント

* レシピ登録をする際に食材選択欄を増減させられること
* 中間テーブルを使ってレシピと食材を関連づけたこと
* 検索機能をつけてレシピを簡単に探せるようにしたこと

# 課題や今後実装したい機能

* 検索の際に漢字、ひらがな、カタカナを区別せずに検索出来るようにすること
* UIの改善をしてより直感的につかえるようにすること
* レシピ登録の際にわかりやすく食材を追加出来るようにすること
* カテゴリー機能を追加すること


# DB設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| username            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |


### Association

- has_many  :recipes

## recipes テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | --------------------------------|
| name                | string     | null: false                     |
| description         | text       | null: false                     |
| user                | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many   :ingredients, through :recipe_ingredients

## recipe_ingredients テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| recipe_id       | references  | null: false, foreign_key: true |
| ingredient_id   | references  | null: false, foreign_key: true |


### Association

- belongs_to :recipe
- belongs_to :ingredient

## ingredients テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| ingredient_name | string      | null: false uniqueness: true   |


### Association

- has_many :recipes, through: recipe_ingredients

