require 'mail'

class Email
  attr_reader :recipient

  def self.execute
    options = { address: 'smtp.gmail.com',
                port: 587,
                domain: 'gmail.com',
                user_name: '',
                password: '',
                authentication: 'plain',
                enable_starttls_auto: true }
    Mail.defaults do
      delivery_method :smtp, options
    end

    Mail.deliver do
      to []
      bcc []
      from ''
      subject 'BACKPAY'
      body File.read('email_template.html')
    end
  end
end

send_email = Email.execute
