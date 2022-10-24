# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| birthday           | date   | null: false |
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| firstname_kana     | string | null: false |
| lastname_kana      | string | null: false |

### Association
- has_many :items
- has_many :orders




## items テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false |
| detail             | text       | null: false |
| state              | integer    | null: false |
| area               | integer    | null: false |
| category           | integer    | null: false |
| day                | integer    | null: false |
| burden             | integer    | null: false |

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




## addressess テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal             | string     | null: false |
| area               | string     | null: false |
| city               | string     | null: false |
| block              | string     | null: false |
| building           | string     | null: false |
| number             | string     | null: false |
| order              | references | null: false |

### Association
- belongs_to :order




