class Day < ActiveRecord::Base
 @@minimum_number_of_gratitudes = 3
 
 has_many :gratitudes, :foreign_key => 'day_id', :class_name => "Gratitude"
 
  def canShare
      self.gratitudes.length == @@minimum_number_of_gratitudes   
  end
end
