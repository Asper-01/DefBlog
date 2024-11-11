class RemoveThemeFromArticles < ActiveRecord::Migration[7.1]
  def change
    remove_column :articles, :theme, :string
  end
end
