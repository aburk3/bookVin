class Book < ActiveRecord::Base
  has_many :meetings
  has_many :clubs, :through => :meetings

end
