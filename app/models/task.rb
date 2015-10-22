class Task < ActiveRecord::Base
  belongs_to :authorization
  belongs_to :card
end
