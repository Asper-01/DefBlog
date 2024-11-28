class UpdateForeignKeyOnTags < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :tags, :categories if foreign_key_exists?(:tags, :categories)
    add_foreign_key :tags, :categories, on_delete: :cascade 
  end
end
