class PledgeMailer < ActionMailer::Base
  default from: "footprint@greenpop.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Pledge Confirmation')
  end
  
end
