class Card < ActiveRecord::Base
  include RankedModel
  has_many :tasks, :dependent => :delete_all
  belongs_to :authorization
  ranks :row_order, :with_same => :authorization_id
end
