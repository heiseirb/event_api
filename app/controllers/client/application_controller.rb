class Client::ApplicationController < ApplicationController
  before_action :verify!

  private

  def verify!
    token = request.headers['X-Token']
    secret = request.headers['X-TokenSecret']
    raise Client::AuthenticationError unless ClientToken.authenticate? token, secret
  end
end

class Client::AuthenticationError < StandardError
  def initialize(msg = '')
    message = msg.presence || 'The token is invalid'
    super message
  end
end
