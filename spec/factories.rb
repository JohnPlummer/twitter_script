Factory.define :account do |a|
  a.sequence (:name) {|n| "foo#{n}"}
  a.access_token 'access_token'
  a.access_secret 'access_secret'
  a.verified true
end
