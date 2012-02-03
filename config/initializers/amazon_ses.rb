ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => ENV['BASE_SES_KEY'],
  :secret_access_key => ENV['BASE_SES_SECRET']
