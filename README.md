# テーブル設計


## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| birthday           | date   | null: false               |
| encrypted_password | string | null: false               |
| firstname          | string | null: false               |
| lastname           | string | null: false               |
| firstname_kana     | string | null: false               |
| lastname_kana      | string | null: false               |

### Association
- has_many :items
- has_many :orders



## items テーブル
| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| name        | string    | null: false                   |
| price       | integer   | null: false                   |
| user        | references| null: false, foreign_key:true |
| detail      | text      | null: false                   |
| state_id    | integer   | null: false                   |
| area_id     | integer   | null: false                   |
| category_id | integer   | null: false                   |
| day_id      | integer   | null: false                   |
| burden_id   | integer   | null: false                   |

### Association
- belongs_to :user
- has_one :order



## orders テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressess テーブル
| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| postal             | string    | null: false                   |
| area_id            | integer   | null: false                   |
| city               | string    | null: false                   |
| block              | string    | null: false                   |
| building           | string    |                               |
| phonenumber        | string    | null: false                   |
| order              | references| null: false, foreign_key:true |

### Association
- belongs_to :order


