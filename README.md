# テーブル設計

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
| ingredient          | integer    | null: false                     |
| description         | text       | null: false                     |
| user                | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many   :ingredients, through :recipe_ingredients

## recipe_ingredients テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| recipe_id       | references  | null: false, foreign_key: true |
| ingredients_id  | references  | null: false, foreign_key: true |


### Association

- belongs_to :recipe
- belongs_to :ingredient

## ingredients テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| ingredient_name | string      | null: false                    |


### Association

- has_many :recipes, through: recipe_ingredients