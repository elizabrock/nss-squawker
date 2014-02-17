if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => 'xxx',
      :aws_secret_access_key => 'yyy',
    }
    config.fog_directory = 'uploads'
    config.fog_public    = false
  end
end