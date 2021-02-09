## users テーブル

| Column            | Type                   | Options                              |
| ------------------| ---------------------- | -------------------------------------|
| nickname          | string                 | null: false, default: ""             |
| email             | string                 | null: false, unique true, default: ""|
| encrypted_password| string                 | null: false                          |
| firstname         | string                 | null: false                          |
| lastname          | string                 | null: false                          |
| firstnamedetail   | string                 | null: false                          |
| lastnamedetail    | string                 | null: false                          |
| birthday          | integer                | null: false                          |


### Association

- has_many :items
- has_many :order

## items テーブル

| Column        | Type          | Options                       |
| --------------| --------------| ------------------------------|
| name          | string        | null: false                   |
| discribe      | text          | null: false                   |
| price         | integer       | null: false                   |
| category_id   | integer       | null: false                   |
| status_id     | integer       | null: false                   |
| bearer_id     | integer       | null: false                   |
| region_id     | integer       | null: false                   |
| delivar_at_id | integer       | null: false                   |
| user          | references    | null: false,foreign_key: true |


### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column       | Type          | Options                       |
| ------------ | --------------| ----------------------------- |
| item         | references    | null: false,foreign_key: true |
| user         | references    | null: false,foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column     | Type       | Options     |
| -----------| -----------| ------------|
| post_num   | string     | null: false |
| region_id  | integer    | null: false |
| cwtv       | string     | null: false |
| address    | integer    | null: false | 
| building   | string     |             |
| phone_num  | string     | null: false |
| orders     | references | null: false | 

### Association

- belongs_to :order


