class RemoveDateFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :date, :datetime
  end
end
