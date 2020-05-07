class Comment < ApplicationRecord
  include Sanitize

  has_many :children, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: 'Comment'

  belongs_to :post
  # belongs_to :user

  validates :description, length: { maximum: 100 }
end
