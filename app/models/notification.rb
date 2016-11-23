
require 'rubygems'
require 'twilio-ruby'

class Notification

  TWILIO_SID  = ENV['twilio_sid']
  TWILIO_AUTH = ENV['twilio_auth']
  MY_NUMBER   = ENV['my_number']

  def initialize(args = {})
    @client = args.fetch(:client, twilio_client)
  end

  def send_message(text, receiver = MY_NUMBER)
    client.messages.create(
      from: '+16194323588',
      to:   receiver,
      body: text)
  end

  private
    attr_reader :client

    def twilio_client
      Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH)
    end
end
