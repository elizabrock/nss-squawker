class NotificationMailer < ActionMailer::Base

  default from: "from@example.com"

  def mention_email(user, mentioner, squeek)
    @user = user
    @mentioner = mentioner
    @squeek = squeek
    mail(to: @user.email, subject: 'Someone has mentioned you in a squeek!')
  end

end
