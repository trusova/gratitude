desc "Daily gratitude reminders"
 task :send_reminders => :environment do
 User.all.each do |u|
      Notifier.daily_email(u.email).deliver
 end
end
