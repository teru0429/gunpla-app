# アプリケーション名
## GANPLA Create Chat

# アプリケーションの概要
## 自身が作ったガンプラを投稿、ユーザー同士でのチャットを楽しむアプリケーション

## :globe_with_meridians: AppのURL
 https://gunpla-app-33042.herokuapp.com/

## テスト用のアカウント


## 工夫した点



## 目指した課題解決
このアプリケーションを通じて、SNSに慣れていないユーザーに対しての課題を解決しようと思いました。

## :clipboard: 洗い出した要件
|ユーザー機能   |誰がどんな作品を投稿したか |そのユーザーが過去に投稿したものが見れるようにする |ユーザーに関する情報が見れるようにする(投稿作品など)|
|投稿機能   　　|作品を投稿するため        |全ユーザーの投稿が見れるようにする |ログイン・ログアウト問わず投稿作品を見れるようにする|
|チャット機能   |他のユーザーとのコミュニケーションをとるため |交流、情報交換などができる |ユーザー同士での会話がでる |
|コメント機能   |作品に対してのコメントができるように |作品に評価を与えるため   |一つの作品にコメントする |
|カテゴリ機能   |カテゴリーに分け検索をスムーズに |検索に時間をかけずにスムーズにする |カテゴリー欄を設けそれにあった作品を検索する |

## 実装した機能についてのGIFと説明
イメージとしてはインスタやPinterestがベース
複数画像投稿を実装したのは多く投稿することで自身が作った作品をよりアピールしたいと思ったからです。テックキャンプで実装した一枚のみの画像投稿では、アピールできることができないため、複数投稿機能を使い、作品をよりアピールしたいと思ったからです。

チャット機能を実装したのは人との輪を広げようと思ったからです。TwitterやInstagramなどのSNSがあるが、不特定多数のユーザーが多いので、SNSになれないユーザーのために少しでもなれて欲しいという思いで作りました。


## 実装予定の機能
フォロー、フォロワー機能
いいね機能、いいねの数順に一覧を表示する機能

## データベース設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |

### Association

- has_many :tweets
- has_many :comments
- has_many :room_users
- has_many :rooms,through: room_users
- has_many :chats

## tweets テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | string     | null: false                    |
| text1      | text       |                                |
| text2      | text       |                                |
| text3      | text       |                                |
| text4      | text       |                                |
| user       | references | null: false, foreign_key: true |
### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references |             |
| prototype   | references |             |

### Association

- belongs_to :user
- belongs_to :comment

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |

### Association

- has_many :room_users
- has_many :rooms,through: room_users
- has_many :chats

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     |                                |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## chats テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
