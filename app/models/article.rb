class Article < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  has_and_belongs_to_many :tags, join_table: :articletags

  # Attribut virtuel pour la suppression d'image
  attr_accessor :remove_image

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  validates :author, presence: true

  # Callbacks
  before_save :purge_image_if_requested

  private

  # Supprime l'image si l'utilisateur demande sa suppression
  def purge_image_if_requested
    image.purge if ActiveModel::Type::Boolean.new.cast(remove_image)
  end
end
