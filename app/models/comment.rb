class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, -> { where(parent_id: nil) }, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  validates :content, presence: true, length: { minimum: 5 }
  validate :parent_must_not_have_parent

  private

  def parent_must_not_have_parent
    if parent&.parent_id.present?
      errors.add(:parent, "Vous ne pouvez pas répondre à une réponse.")
    end
  end
end
