class Account < ActiveRecord::Base

  def sign_in(access_token, access_secret)
    self.access_token = access_token
    self.access_secret = access_secret
    self.save!
  end

  def sign_out
    self.access_token = nil
    self.access_secret = nil
  end

  def authorized?
    self.authorized
  end

end
