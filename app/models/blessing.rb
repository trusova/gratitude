class Blessing < ActiveRecord::Base

belongs_to :user
validates_presence_of :answer
validates_presence_of :user

end
