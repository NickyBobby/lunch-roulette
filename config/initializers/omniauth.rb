Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_CLIENT_ID'], ENV['SLACK_CLIENT_SECRET'], scope: "identify, read, post", team: "T029P2S9M"
end
