class Post < ApplicationRecord
  include Sanitize

  enum status: {
      draft: 'Draft',
      published: 'Published',
      archived: 'Archived'
  }

  # belongs_to :user
  has_many :tags, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }

  validate :validate_status

  def validate_status
    if Post.draft.where(user_id: user_id).size > 1
      errors.add(:base, 'User can not have more than 1 post in draft state. ')
    end
  end
end
