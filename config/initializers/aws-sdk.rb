aws_env = File.join(Rails.root, 'config', 'aws_env.rb')
load(aws_env) if File.exists?(aws_env)
AWS.config(access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'])
