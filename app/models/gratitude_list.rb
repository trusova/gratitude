class GratitudeList < ActiveRecord::Base
  MAX_NUM_GRATITUDES = 3
  
  belongs_to :user
  has_many :days, :order => 'count DESC'
  
  def self.latest_list_for_user(user)
    gratitude_lists = GratitudeList.find_all_by_user_id(user.id)
    
    gratitude_list = nil
    
    if gratitude_lists.empty?
      gratitude_list = GratitudeList.create(:user => user)
    else
      gratitude_list = gratitude_lists.last
      
      if gratitude_list.days.length >= 21 and gratitude_list.days.last.gratitudes.length >= 3
        gratitude_list = GratitudeList.create(:user => user)
      end
    end
      
    gratitude_list
  end
  
  def current_day
    today = self.days.first

    if today.nil?
      today = Day.create(:gratitude_list => self)
    elsif today.gratitudes.length >= 3
      today = Day.create(:gratitude_list => self)
    end
    
    today
    end
    
end
