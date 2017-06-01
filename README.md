# DB設計

## users table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false                            |
| image     | string  |                                        |

### Association

* has_many :reservations

## owner table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false,                           |
| image     | string  |                                        |

### Association

* has_many :spaces

## space table

|  Column   |  Type      |              Option                    |
|:----------|:----------:|:---------------------------------------|
| name      | string     | null: false                            |
| image     | string     |                                        |
| purpose   | string     | null: false                            |
| text      | text       | null: false                            |
| hour      | text       |                                        |
| postal_code | integer  | null: false                            |
| prefecture | string    | null: false                            |
| city      | string     | null: false                            |
| town      | string     | null: false                            |
| building  | string     |                                        |
| tel       | string     | null: false                            |
| access    | text       | null: false                            |
| price     | integer    | null: false                            |
| owner_id  | references | foreign_key: true                      |

### Association

* belongs_to :owner

* has_many :plans

* has_many :reservations

## plan table

|  Column   |  Type      |              Option                    |
|:----------|:----------:|:---------------------------------------|
| name      | string     | null: false                            |
| price_hour | integer   |                                        |
| price_day | integer    |                                        |
| space_id  | references | foreign_key: true                      |

### Association

* belongs_to :space

* has_many :reservations

## reservation table

|  Column   |  Type      |              Option                    |
|:----------|:----------:|:---------------------------------------|
| date      | string     | null: false                            |
| time      | integer    |                                        |
| user_id   | references | foreign_key: true                      |
| space_id  | references | foreign_key: true                      |
| plan_id   | references | foreign_key: true                      |

### Association

* belongs_to :user

* belongs_to :space

* belongs_to :plan
