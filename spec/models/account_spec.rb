require 'spec_helper'

describe Account do
  account = Account.find_or_create_by_name 'test_account'
  account.sign_in 'token', 'secret'
  # pending "add some examples to (or delete) #{__FILE__}"
end
