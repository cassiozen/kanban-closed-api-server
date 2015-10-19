class Card < ActiveRecord::Base
  has_many :tasks, :dependent => :delete_all
  belongs_to :list
  acts_as_list
  belongs_to :authorization
  default_scope { where(authorization_id: Authorization.current_id) }
end
