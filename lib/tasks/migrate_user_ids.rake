namespace :migrate do
  desc 'Migrate all existing gratitudes to a gratitudes list'
  task :gratitudes_to_list => :environment do
    puts "Preparing to migrate gratitudes to a gratitude list"
    users = User.all
    
    users.each do |user|
      puts "user: #{user.inspect}"
      
      gratitude_list = GratitudeList.create(:user => user)
      
      gratitudes = user.gratitudes
      
      day_count = 0
      gratitudes.each do |gratitude|
        gratitude_list.reload
        if gratitude_list.days.length >= 21
          gratitude_list = GratitudeList.create(:user => user)
          day_count += 1
        end
        
        day_num = gratitude.day - (21 * day_count)
        current_day = Day.find_by_gratitude_list_id(gratitude_list.id, :conditions => ["count = ?", day_num])
        
        if current_day.nil?
          current_day = Day.create(:gratitude_list => gratitude_list, :count => day_num)
        end
        
        current_day.gratitudes << gratitude
      end
    end
  end
end
