require 'simplecov'
SimpleCov.start('rails')

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:slack] = OmniAuth::AuthHash.new({
    provider: 'slack',
    uid: '12345',
    info: {
      name: 'Nicholas Dorans',
      nickname: 'nickynonaps',
      first_name: 'Nicholas',
      last_name:  'Dorans'
    },
    credentials: {
      token: ENV['SLACK_CLIENT_ID']
              },
      extra: {
        raw_info: {
          avatar_url: "https://avatars.githubusercontent.com/u/14022835?v=3"
        }
      }
    })
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
