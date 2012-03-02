class Day < ActiveRecord::Base
 @@minimum_number_of_gratitudes = 3
 
 belongs_to :gratitude_list
 has_many :gratitudes, :order => 'created_at DESC'
 
 before_save :increment_count
 
  def canShare
      self.gratitudes.length == @@minimum_number_of_gratitudes   
  end
  
  def increment_count
    gratitude_list = self.gratitude_list
    self.count = gratitude_list.days.length + 1
  end
  
end
