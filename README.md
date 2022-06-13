## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :destinations

## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | text      | null: false                    |
| text               | text      | null: false                    |
| category_id        | integer   | null: false                    |
| situation_id       | integer   | null: false                    |
| delivery_charge_id | integer   | null: false                    |
| prefectures_id     | integer   | null: false                    |
| shipping_date_id   | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :destination

## destinations テーブル

| Column             | Type      | Options                         |
| ------------------ | --------- | ------------------------------- |
| user               | reference | null: false, foreign_key: true  |
| item               | reference | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| destination        | reference  | null: false, foreign_key: true |

### Association
- belongs_to :destination
