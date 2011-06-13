VCR.config do |c|
  c.cassette_library_dir = File.expand_path('features/fixtures/vcr_cassettes', Rails.root)
  c.stub_with :fakeweb
  c.allow_http_connections_when_no_cassette = false
  c.default_cassette_options = { :record => :none }
end

VCR.cucumber_tags do |t|
  t.tag  '@twitter'#, :record => :new_episodes
end
