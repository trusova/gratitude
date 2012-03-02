class Gratitude < ActiveRecord::Base

belongs_to :day

validates_presence_of :answer

has_attached_file :avatar, 
                  :styles => { :medium => "480x320>",
                               :thumb => "100x100>" }
                    



             def self.gratitude(day)
                          Gratitude.new(:day => day)
             end

end
