OmniAuth.config.test_mode = true
# OmniAuth.config.add_mock(:twitter, {
#  :uid => "123545",
#  :username => "@pete"
# })

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  :provider => 'twitter',
  :uid => '123545',
  :nickname => 'bopperz'
  # etc.
})