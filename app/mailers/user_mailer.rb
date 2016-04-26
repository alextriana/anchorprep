class UserMailer < ApplicationMailer

  def sendgrid_client
    @sendgrid_client = SendGrid::Client.new(api_key: ENV["SENDGRID_APIKEY"])
  end

  def contact_alert(admin_user, user, message) 
    recipient = SendGrid::Recipient.new(admin_user.email)
    recipient.add_substitution('admin_first_name', admin_user.first_name)
    recipient.add_substitution('request_name', user.first_name)
    recipient.add_substitution('contact_email', user.email.length > 0 ? user.email : "Not provided")
    recipient.add_substitution('request_type', user.relationship == nil ? "None" : user.relationship)
    recipient.add_substitution('request_message', message)

    template = SendGrid::Template.new('af595ccc-7543-486c-b9b6-893de75e63c4')
    mail_defaults = {
      from: 'anchorprep@gmail.com',
      subject: "AnchorPrep received an inquiry",
      text: '<3',
      html: '<p></p>'
    }
    mailer = SendGrid::TemplateMailer.new(sendgrid_client, template, [recipient])
    mailer.mail(mail_defaults)
  end


  def contact_confirmation(user)
    recipient = SendGrid::Recipient.new(user.email)
    recipient.add_substitution('first_name', user.first_name)
    template = SendGrid::Template.new('79339491-c997-47b1-be08-e25f60c80140')
    mail_defaults = {
      from: 'anchorprep@gmail.com',
      subject: "Inquiry Confirmation",
      text: '<3',
      html: '<p></p>'
    }
    mailer = SendGrid::TemplateMailer.new(sendgrid_client, template, [recipient])
    mailer.mail(mail_defaults)

  end

end
