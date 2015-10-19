class Task < ActiveRecord::Base
  belongs_to :card
  default_scope { where(authorization_id: Authorization.current_id) }
end
