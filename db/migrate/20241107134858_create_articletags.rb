class CreateArticletags < ActiveRecord::Migration[7.1]
  def change
    create_table :articletags do |t|
      t.references :article, null: false, foreign_key: { to_table: :articles }
      t.references :tag, null: false, foreign_key: { to_table: :tags }

      t.timestamps
    end
  end
end
