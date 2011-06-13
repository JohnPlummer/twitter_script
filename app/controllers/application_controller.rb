require 'twitter/authentication_helpers'

class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers
  protect_from_forgery

  rescue_from Twitter::Unauthorized, :with => :force_sign_in
  rescue_from Errors::AccountNotVerified, :with => :account_not_verified

  private

  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new(ENV['CONSUMER_KEY'],
                                            ENV['CONSUMER_SECRET'],
                                            :site => 'http://api.twitter.com',
                                            :request_endpoint => 'http://api.twitter.com',
                                            :sign_in => true)
  end

  def client
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end
  helper_method :client

  def force_sign_in(exception)
    reset_session
    flash_message :error, "It seems your credentials are not good anymore. Please sign in again."
    redirect_to new_session_path
  end

  def account_not_verified(exception)
    reset_session
    flash_message :error, "Sorry, your account needs to be verified."
    redirect_to new_session_path
  end

  def flash_message(type, text)
    flash[type] ||= []
    flash[type] << text
  end

end
