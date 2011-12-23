class Notifier < ActionMailer::Base
  default :from => "your.gratitudes@gmail.com"

def daily_email(user_email)

    mail(   :to      => user_email,
            :from    => "your.gratitudes@gmail.com",
            :subject => "What are you grateful for today?") do |format|
                format.text
                format.html
    end
end  
end
