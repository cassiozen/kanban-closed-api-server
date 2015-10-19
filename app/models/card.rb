class Card < ActiveRecord::Base
  has_many :tasks
  belongs_to :list
  acts_as_list
end
