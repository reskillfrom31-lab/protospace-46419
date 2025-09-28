class CreatePrototypes < ActiveRecord::Migration[7.1]
  def change
    create_table :prototypes do |t|
      t.string :title, null: false
      t.string :catch_copy, null: false
      t.string :concept, null: false
      t.timestamps
    end
  end
end
