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

●アプリケーション名
 :habitMaker

●アプリケーション概要
：チャット機能＋メモ投稿機能

●URL
：https://habit-share-app.herokuapp.com/

●テスト用アカウント

email: takagi@docomo

パスワード： 123456a

●利用方法
：習慣・達成したいことをリストに登録して、グラープ内のメンバーに共有する。共有したリストに対して、グループ内でチャットをする。

●目指した課題解決
：何かをやり遂げたい人、目標を達成したい人が、やるべきことが明確にならないこと・継続できないことの問題解決を目指した

●洗い出した要件
：https://docs.google.com/spreadsheets/d/172qXbdSfyqv9N2cMBrr1mluDXVTVnbI58Yvd_8Dsg-A/edit#gid=282075926

●実装した機能についての画像やGIFおよびその説明
①チャット＋メモ表示の複合機能
https://gyazo.com/e5b6b21864572dfe7bf9e24a7f55fb26
上記ページより、実装した機能を確認することができます。
ユーザー登録が必須となっており、登録完了することで使用可能となります。チャット・メモを共有し合うユーザーは、下記画面で選択することができます。

https://gyazo.com/8b84084c3f0ff45e959b6f94a429626d
ユーザーが達成した目標や、毎日することを上記リストに登録することで、グループ内のユーザーと共有することができます。リストは、複数の登録が可能であり、登録したリストはプルダウンのバーから選択できます。選択して変更ボタンをクリックすることで、リストがページに反映されます。
登録した複数のリストを簡単に変更可能することにフォーカスしたアプリとなっています。

ページ下にはチャット機能を実装しており、メモが見える状態でのチャットが可能となっています。これにより、各目標や、継続したいことを明確化した上での話し合いや、応援が可能となるため、目標達成するためのサポートを目的としたアプリとなっています。

●実装予定の機能

・達成できていない項目への通知機能

・グループを複数人での構成

・チェック及び達成率集計機能


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
- has_many :habits

<!-- roomsテーブル -->
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- has_many :message_habits
- has_many :habits, through: :message_habits


<!-- habitsテーブル -->
| Column | Type   | Options                        |
| ------ | ------ | ------------------------------ |
| title  | string | null: false                    |
| item1  | string | null: false                    |
| item2  | string |                                |
| item3  | string |                                |
| item4  | string |                                |
| item5  | string |                                |
| user   | string | null: false, foreign_key: true |

- belongs_to :user
- has_many :rooms_habits
- has_many :rooms, through: :room_habits

<!-- messagesテーブル -->
| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| comment | string     | null: false                    |
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
| message | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :habit