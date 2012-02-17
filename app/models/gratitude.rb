class Gratitude < ActiveRecord::Base

belongs_to :user
belongs_to :day

validates_presence_of :answer
validates_presence_of :user

has_attached_file :avatar, 
                    :styles => { :medium => "480x320>",
                                 :thumb => "100x100>" }

end
