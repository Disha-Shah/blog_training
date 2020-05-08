class Comment < ApplicationRecord
  include Sanitize

  has_many :children, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: 'Comment'

  belongs_to :post
  delegate :title, to: :post, prefix: true, allow_nil: true

  # belongs_to :user

  validates :description, presence: true, length: { maximum: 100 }

  validate :validate

  before_save -> { count_words(:description) }

  def validate
    if wrong_words(description)
      errors.add(:description, 'can not have bad words.')
    end
  end

end
