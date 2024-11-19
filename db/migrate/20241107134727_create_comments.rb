class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :article, null: false, foreign_key: { to_table: :articles }
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
