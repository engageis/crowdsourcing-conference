if Rails.env.development?
  Paperclip.options[:command_path] = "/opt/local/bin"
end