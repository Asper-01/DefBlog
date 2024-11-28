class UpdateForeignKeyOnArticletags < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :articletags, :tags if foreign_key_exists?(:articletags, :tags)
    add_foreign_key :articletags, :tags, on_delete: :cascade 
  end
end
