CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAILDCXYJ353O4PX5A',       # required
    :aws_secret_access_key  => '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',  # required
    #:region                 => 'eu-west-1'                   # optional, defaults to 'us-east-1'
    #:hosts                  => 's3.example.com'              # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'ibharati-radio'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end