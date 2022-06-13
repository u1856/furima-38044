## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | text   | null: false               |
| birth_month        | text   | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :destinations

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | text      | null: false                    |
| image              | string    | null: false                    |
| text               | text      | null: false                    |
| category           | string    | null: false                    |
| situation          | string    | null: false                    |
| delivery_charge    | string    | null: false                    |
| prefectures        | string    | null: false                    |
| shipping_date      | string    | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association
- has_one :destination

## destinations テーブル

| Column             | Type      | Options                         |
| ------------------ | --------- | ------------------------------- |
| user               | reference | null: false, foreign_key: true  |
| item               | reference | null: false, foreign_key: true  |

### Association
- belongs_to :item
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |
| destination        | reference  | null: false, foreign_key: true |

### Association
- belongs_to :destination
