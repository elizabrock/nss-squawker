CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'secret',
    :aws_secret_access_key  => 'secret',
  }
  config.fog_directory  = 'my_uploads'
  config.fog_public     = false
end