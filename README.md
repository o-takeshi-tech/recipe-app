# RecipeRator

## 料理の『めんどくさい』をなくす為のアプリケーション

[![Image from Gyazo](https://i.gyazo.com/cf2c2d3d3a3f1f644ca8847994a16d10.jpg)](https://gyazo.com/cf2c2d3d3a3f1f644ca8847994a16d10)

# 概要

## 今日冷蔵庫にある食材だけで料理を作りたいというニーズに応えたアプリケーション

誰でも簡単にレシピを登録したり、他者の登録したレシピを参考にすることが出来るアプリ。
食材や料理名を検索することで意図したレシピを検索することが出来る。

# 本番環境

http://52.68.31.63/

## 投稿用ユーザー

* メールアドレス:hoge@hoge
* パスワード:hoge1111

## 確認用ユーザー

* メールアドレス:fuga@fuga
* パスワード:fuga2222


# 利用方法

* トップページから新規登録orログイン
* 新規投稿は画面右上の新規投稿をクリック
* 新規登録後は一覧表示へ移る

[![Image from Gyazo](https://i.gyazo.com/89d514265a8a4bb27a3a9ae9c2989f7b.gif)](https://gyazo.com/89d514265a8a4bb27a3a9ae9c2989f7b)
[![Image from Gyazo](https://i.gyazo.com/112c47ed3feffa4cf324f6eefe41f93a.gif)](https://gyazo.com/112c47ed3feffa4cf324f6eefe41f93a)

* 一覧表示画面から投稿を選択すると詳細レシピを確認できる
* 投稿者本人であれば投稿の編集・削除が可能


* レシピ名や食材名を検索すると該当のレシピのみが表示される
* 該当のレシピがない場合はレシピ登録のリンクが表示される

[![Image from Gyazo](https://i.gyazo.com/08e0b0c994ea0927f5f57b67e5702fca.gif)](https://gyazo.com/08e0b0c994ea0927f5f57b67e5702fca)
[![Image from Gyazo](https://i.gyazo.com/a79fd2bc7cd392aa797e209e34a8c460.gif)](https://gyazo.com/a79fd2bc7cd392aa797e209e34a8c460)


# 課題解決

| ユーザーストーリーから考える課題                     |    課題解決                                   |
| ---------------------------------------------- | -------------------------------------------- |
| レシピを考えることがめんどくさいという課題            | レシピ登録をしておくことで作れる料理を探せるようにする |
| 冷蔵庫にある少ない食材でつくれる料理を知りたいという課題 | 検索機能で食材名のみで検索できるようにする          |

# 機能一覧

| 機能              | 概要                                    |
| ---------------- | --------------------------------------- |
| ユーザー管理機能    | 新規登録・ログイン・ログアウトが可能          |
| レシピ投稿機能      | 写真付きのレシピを登録することが可能         |
| レシピ詳細表示機能   | 各レシピの詳細ページで作成方法が確認可能     |
| レシピ編集・削除機能 | 投稿者本人のみ編集と削除が可能              |
| 食材登録機能        |  食材を登録することが可能                 |
| レシピ検索機能      |  レシピ名・食材名でレシピを検索することが可能 |

## レシピ投稿機能

| 特徴              | 概要                                                  |
| ---------------- | ----------------------------------------------------- |
| 食材欄の追加・削除  | 追加・削除をクリックすることで食材欄を追加・削除することができる |

## レシピ投稿機能

| 特徴         | 概要                                                    |
| ------------ | ------------------------------------------------------ |
| 検索候補の表示 | 入力された値が保存された食材名に該当する場合は検索候補が表示される |


# 追加予定機能

* レシピ登録機能の簡略化
* アプリ全体のUI変更
* カテゴリー機能
* マイページ機能

# 開発環境

* VScode
* Ruby 2.6.5
* Ruby on Rails 6.0.3.4
* mysql 14.14
* JavaScript
* AWS



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
| user_id             | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many   :ingredients, through :recipe_ingredients
- has_many   :quantities

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
- has_many :quantities

## quantities テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| quantity        | string      | null: false                    |
| ingredient_id   | references  | null: false  foreign_key: true |
| recipe_id       | references  | null: false  foreign_key: true |


### Association

- belongs_to :recipe
- belongs_to :ingredient


