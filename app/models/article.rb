class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  def article_params # empêche le champ author_id d'être manipulé par l'utilisateur
  end
end
