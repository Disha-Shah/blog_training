module Sanitize
  extend ActiveSupport::Concern

  # Reserved Name for declaring class methods
  module ClassMethods
    def count_vowels(value)
      value.count('aeoui')
    end
  end

  def wrong_words(value)
    words = ['bad', 'poor', 'filthy', 'dirty', 'stupid']
    (words.include? value)
  end

  # Not required when extended ActiveSupport::Concern
  # def self.included(including_class)
  #   # including_class.extend ClassMethods
  #
  #   including_class.class_eval do
  #     extend ClassMethods
  #     belongs_to :user
  #   end
  # end

  included do
    belongs_to :user
  end
end