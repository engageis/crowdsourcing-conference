S3_CONF = {}

if Rails.env.development?
  Paperclip.options[:command_path] = "/opt/local/bin"
elsif Rails.env.production?
  S3_CONF = {
    storage: :s3,
    path: ":attachment/:id/:style.:extension",
    bucket: ENV['S3_BUCKET_NAME'],
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
    s3_protocol: 'https',
    :url => "/system/:attachment/:id/:style/:filename"
  }
end