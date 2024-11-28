class ChangeCategoryIdInTags < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tags, :category_id, false
  end
end
