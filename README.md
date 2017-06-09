# DB設計

## users table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false                            |
| image     | string  |                                        |

### Association

* has_many :reservations

## owners table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false,                           |
| image     | string  |                                        |

### Association

* has_many :spaces

## spaces table

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
| body      | string     |                                        |
| number    | integer    | null: false                            |
| owner_id  | references | foreign_key: true                      |

### Association

* belongs_to :owner

* has_many :reservations

## reservations table

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

## events table

|  Column   |  Type      |              Option                    |
|:----------|:----------:|:---------------------------------------|
| name      | string     | null: false                            |
| body      | integer    |                                        |
| target    | references | foreign_key: true                      |
| space_id  | references | foreign_key: true                      |
| reservation_id | references | foreign_key: true                      |

### Association

* belongs_to :space

* belongs_to :reservation

* has_many :users, through: event_users

* has_many :event_users

## event_users table

|  Column   |  Type      |              Option                    |
|:----------|:----------:|:---------------------------------------|
| event_id  | references | foreign_key: true                      |
| user_id   | references | foreign_key: true                      |

### Association

* belongs_to :event

* belongs_to :user
