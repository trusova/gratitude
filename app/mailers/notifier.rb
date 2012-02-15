class Notifier < ActionMailer::Base
  default :from => "reminder@gratitude.is"

def daily_email(user_email)

    mail(   :to      => user_email,
            :from    => "reminder@gratitude.is",
            :subject => "Valentine's for sharing!") do |format|
                format.text
                format.html
    end
end  
end
