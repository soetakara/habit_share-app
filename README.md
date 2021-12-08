# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- テーブル設計 -->

<!-- usersテーブル -->
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages
- has_one  :habits

<!-- roomsテーブル -->
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- has_many :room_habits
- has_many :habits, through: :room_habits

<!-- habitsテーブル -->
| Column | Type   | Options                        |
| ------ | ------ | ------------------------------ |
| item1  | string | null: false                    |
| item2  | string |                                |
| item3  | string |                                |
| item4  | string |                                |
| item5  | string |                                |
| user   | string | null: false, foreign_key: true |

- belongs_to :user
- has_many :room_habits
- has_many :rooms, through: :room_habits

<!-- messagesテーブル -->
| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :user

<!-- room_usersテーブル -->
| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :user

<!-- room_habitsテーブル -->
| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| habit   | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :habit