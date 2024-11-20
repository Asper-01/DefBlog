class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :theme

      t.timestamps
    end
  end
end