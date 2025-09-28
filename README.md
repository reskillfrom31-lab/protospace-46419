# ProtoSpace (アプリケーション名)

これは、ユーザーが自身の制作したプロトタイプを投稿し、他者からフィードバックをもらうためのアプリケーションです。

## 主な機能

*   **ユーザー認証機能**: ユーザーは新規登録、ログイン、ログアウトができます。
*   **プロトタイプ投稿・管理機能**: ログインユーザーはプロトタイプの情報を投稿、編集、削除できます。
*   **コメント機能**: ログインユーザーは各プロトタイプに対してコメントを投稿できます。
*   **画像投稿機能**: プロトタイプには画像を添付できます（Active Storageを利用）。

## データベース設計 (Database Schema)

このアプリケーションは以下のテーブルを使用しています。

### `users` テーブル

| カラム名             | 型           | オプション                   | 概要           |
| -------------------- | ------------ | ---------------------------- | -------------- |
| `email`              | `string`     | `null: false`, `unique: true`  | メールアドレス |
| `encrypted_password` | `string`     | `null: false`                | 暗号化パスワード |
| `name`               | `string`     | `null: false`                | ユーザー名     |
| `profile`            | `text`       | `null: false`                | プロフィール文 |
| `position`           | `text`       | `null: false`                | 役職・所属     |

### `prototypes` テーブル

| カラム名     | 型           | オプション                          | 概要           |
| ------------ | ------------ | ----------------------------------- | -------------- |
| `title`      | `string`     | `null: false`                       | タイトル       |
| `catch_copy` | `text`       | `null: false`                       | キャッチコピー |
| `concept`    | `text`       | `null: false`                       | コンセプト     |
| `user`       | `references` | `null: false`, `foreign_key: true`  | 投稿したユーザー |

※ プロトタイプの画像はActive Storageで管理されます。

### `comments` テーブル

| カラム名    | 型           | オプション                          | 概要               |
| ----------- | ------------ | ----------------------------------- | ------------------ |
| `content`   | `text`       | `null: false`                       | コメント内容       |
| `prototype` | `references` | `null: false`, `foreign_key: true`  | コメント先のプロトタイプ |
| `user`      | `references` | `null: false`, `foreign_key: true`  | コメントしたユーザー   |

## セットアップ手順 (Setup)

1.  **リポジトリをクローンする**
    ```bash
    git clone https://github.com/your_username/your_repository.git
    cd your_repository
    ```

2.  **必要なgemをインストールする**
    ```bash
    bundle install
    ```

3.  **データベースを作成・マイグレーションする**
    ```bash
    bin/rails db:create
    bin/rails db:migrate
    ```

4.  **Active Storageのテーブルを作成する**
    ```bash
    bin/rails active_storage:install
    bin/rails db:migrate
    ```

## アプリケーションの起動 (Usage)

以下のコマンドで開発サーバーを起動します。

```bash
bin/rails server