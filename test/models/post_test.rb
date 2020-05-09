require 'test_helper'

class PostTest < ActiveSupport::TestCase
  #Associations
  should belong_to(:user)
  should have_many(:tags).dependent(:destroy)

  #Validations
  should validate_presence_of(:title)
  should validate_length_of(:title).is_at_most(50)
  should validate_presence_of(:body)
  should validate_length_of(:body).is_at_most(200)

  should_not allow_value('bad').for(:title)
  should_not allow_value('It is bad').for(:title)
  should_not allow_value('poor').for(:title)
  should_not allow_value('poor housing conditions').for(:title)
  should_not allow_value('filthy').for(:title)
  should_not allow_value('filthy road').for(:title)
  should_not allow_value('dirty').for(:title)
  should_not allow_value('dirty streets').for(:title)
  should_not allow_value('stupid').for(:title)
  should_not allow_value('Define stupidity').for(:title)
end
