# == Schema Information
# Schema version: 20110531091332
#
# Table name: accounts
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  access_token  :string(255)
#  access_secret :string(255)
#  verified      :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

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

  def verified?
    self.verified
  end

  def verify!
    self.verified = true
    self.save!
  end

  def deverify!
    self.verified = false
    self.save!
  end
end
