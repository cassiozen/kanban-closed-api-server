class Authorization < ActiveRecord::Base
  has_many :cards, :dependent => :delete_all
  has_many :tasks, :dependent => :delete_all
  
  def self.current_id=(id)
    Thread.current[:authorization_id] = id
  end

  def self.current_id
    Thread.current[:authorization_id]
  end
end
