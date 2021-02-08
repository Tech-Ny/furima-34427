## users テーブル

| Column         | Type       | Options                       |
| ---------------| -----------| ------------------------------|
| nickname       | string     | null: false                   |
| email          | string     | null: false                   |
| password       | string     | null: false                   |
| firstname      | string     | null: false                   |
| lastname       | string     | null: false                   |
| firstnamedetail| string     | null: false                   |
| lastnamedetail | string     | null: false                   |
| birthday       | date       | null: false                   |
| item           | references | null: false,foreign_key: true |
| order          | references | null: false,foreign_key: true |


### Association

- has_many :items
- has_many :order

## items テーブル

| Column     | Type          | Options                       |
| -----------| --------------| ------------------------------|
| name       | string        | null: false                   |
| discribe   | text          | null: false                   |
| category   | string        | null: false                   |
| status     | string        | null: false                   |
| bearer     | string        | null: false                   |
| from       | string        | null: false                   |
| delivar_at | string        | null: false                   |
| user       | references    | null: false,foreign_key: true |


### Association

- has_one :order
- belongs_to :user

## order テーブル

| Column       | Type          | Options                       |
| ------------ | --------------| ----------------------------- |
| card_num     | integer       | null: false                   |
| term_month   | integer       | null: false                   |
| term_year    | integer       | null: false                   |
| cvc          | integer       | null: false                   |
| address      | references    | null: false,foreign_key: true |
| user         | references    | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column     | Type   | Options     |
| -----------| -------| ------------|
| post_num   | string | null: false |
| region     | string | null: false |
| cwtv       | string | null: false |
| address    | string | null: false | 
| building   | string | null: false |
| phone_num  | string | null: false |

### Association

- belongs_to :order


