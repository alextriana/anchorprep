class UserMailer < ApplicationMailer

	def mandrill_client
    @mandrill_client ||= Mandrill::API.new ENV["MANDRILL_APIKEY"]
  end

  # user email, name
	def welcome_email(user)
		template_name = "welcome-email"
      template_content = []
      message = {
        to: [{email: user.email}],
        merge_vars: [
          {rcpt: user.email,
           vars: [
              { name: "first_name", content: user.first_name }
          	]
          }
        ]
      }
    mandrill_client.messages.send_template template_name, template_content, message 
	end

  #request type, name message. user name, email
	def contact_alert(admin_user, user, message)
		template_name = "contact-alert"
      template_content = []
      message = {
        to: [{email: admin_user.email}],
        merge_vars: [
          {rcpt: admin_user.email,
           vars: [
              { name: "first_name", content: admin_user.first_name },
              { name: "request_name", content: user.first_name },
              { name: "request_type", content: user.relationship },
              { name: "request_message", content: message }
          	]
          }
        ]
      }
    mandrill_client.messages.send_template template_name, template_content, message 
	end

  # user name, email
	def contact_confirmation(user)
    template_name = "response-from-contact"
      template_content = []
      message = {
        to: [{email: user.email}],
        merge_vars: [
          {rcpt: user.email,
           vars: [
              { name: "name", content: user.first_name }
            ]
          }
        ]
      }
    mandrill_client.messages.send_template template_name, template_content, message 
  end

end
