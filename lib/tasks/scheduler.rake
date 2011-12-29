desc "Daily gratitude reminders"
 task :send_reminders => :environment do
 user = User.find(:all, :conditions => ["reminder = 1"])
 user.each do |u|
      Notifier.daily_email(u.email).deliver
 end
end
