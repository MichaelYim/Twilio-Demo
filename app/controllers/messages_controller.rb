class MessagesController < ApplicationController

  def new
  end

  def create

    account_sid = 'AC5086d4b0defad19fc9d122e675089cf2'
    auth_token = Rails.application.secrets.auth_token
    @client = Twilio::REST::Client.new account_sid, auth_token

    sms = @client.account.messages.create(:body => "Your discount code is EASYSALE",
        :to => params[:message][:number],
        :from => "+15005550006")
    # puts sms.from
    # render plain: sms.inspect
  end
end
