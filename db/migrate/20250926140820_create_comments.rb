class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      # t.integer :user_id / :prototype_id の代わりに t.references を使う
      t.references :user, null: false, foreign_key: true
      t.references :prototype, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end