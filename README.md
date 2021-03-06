# アプリケーション名
### GANPLA Create Chat

# アプリケーションの概要
### 自身が作ったガンプラを投稿、ユーザー同士でのチャットを楽しむアプリケーション
![image](https://user-images.githubusercontent.com/75606622/108032113-4ec5c300-7075-11eb-8174-fdd1f7cf184f.png)

## :globe_with_meridians: AppのURL
 https://gunpla-app-33042.herokuapp.com/
※S3未実装のため画像が24時間以内に削除されます※

## :busts_in_silhouette: テスト用のアカウント
* ニックネーム:ヒロト メールアドレス:gundam@bd.com パスワード:123asd
* ニックネーム:リク   メールアドレス:gundam@bf.com パスワード:123asd

## 工夫した点
オリジナルアプリの作る上で、次の２つを工夫しました。
* 一つ目としてはデザインをシンプルに見やすく作りました。背景色を小緑することによって投稿した作品を目立つことを重視しました。
* 二つ目としてチャット画面をLINE風の画面にしました。LINE風にしておくことで、SNSに不慣れな人にも抵抗を少しでも減らそうと思いこのデザインを選びました。

## 目指した課題解決
このアプリケーションを通じて、SNSに慣れていないユーザーに対しての課題を解決しようと思いました。

## :clipboard: 洗い出した要件
|機能          |目的                   |詳細                                       |ストーリー(ユースケース)                       |
|-------------|-----------------------|------------------------------------------|--------------------------------------------|
|ユーザー機能   |誰がどんな作品を投稿したか |そのユーザーが過去に投稿したものが見れるようにする |ユーザーに関する情報が見れるようにする(投稿作品など)|
|投稿機能   　　|作品を投稿するため        |全ユーザーの投稿が見れるようにする |ログイン・ログアウト問わず投稿作品を見れるようにする|
|チャット機能   |他のユーザーとのコミュニケーションをとるため |交流、情報交換などができる |ユーザー同士での会話がでる |
|コメント機能   |作品に対してのコメントができるように |作品に評価を与えるため   |一つの作品にコメントする |


## 実装した機能についてのGIFと説明
イメージとしてはインスタやPinterestがベース

複数画像投稿を実装したのは多く投稿することで自身が作った作品をよりアピールしたいと思ったからです。テックキャンプで実装した一枚のみの画像投稿では、アピールできることができないため、複数投稿機能を使い、作品をよりアピールしたいと思ったからです。
[![Image from Gyazo](https://i.gyazo.com/93d8c418816e9e96faf49d381ef1d68c.gif)](https://gyazo.com/93d8c418816e9e96faf49d381ef1d68c)

チャット機能を実装したのは人との輪を広げようと思ったからです。TwitterやInstagramなどのSNSがあるが、不特定多数のユーザーが多いので、SNSになれないユーザーのために少しでもなれて欲しいという思いで作りました。
### チャットルーム作成
[![Image from Gyazo](https://i.gyazo.com/d721316417583fdb1f9059761f628616.gif)](https://gyazo.com/d721316417583fdb1f9059761f628616)
### メッセージ送信
[![Image from Gyazo](https://i.gyazo.com/b4c3e028d8276390fd70970cc8a57463.gif)](https://gyazo.com/b4c3e028d8276390fd70970cc8a57463)
### チャットルーム(相手側)
[![Image from Gyazo](https://i.gyazo.com/68b2b80e1a1295f2c6ebd6b565ad8194.gif)](https://gyazo.com/68b2b80e1a1295f2c6ebd6b565ad8194)

## 実装予定の機能
* フォロー、フォロワー機能
* いいね機能、いいねの数順に一覧を表示する機能
* 検索機能
* カテゴリ機能
* SNSアカウント連携機能

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