class Post < ApplicationRecord
  include Sanitize

  enum status: {
      draft: 'Draft',
      published: 'Published',
      archived: 'Archived'
  }

  delegate :email, to: :user, prefix: true

  # belongs_to :user
  has_many :tags, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }

  validate :validate

  before_save -> { count_words(:title) }

  def validate
    if draft? && Post.draft.where(user_id: user_id).any?
      errors.add(:base, 'User can not have more than 1 post in draft state. ')
    end

    if wrong_words(title)
      errors.add(:title, 'can not have bad words.')
    end
  end
end
