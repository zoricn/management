FACEBOOK_INFO = {
  "id" => "12345",
  "link" => "http://facebook.com/john_doe",
  "email" => "user@example.com",
  "name" => "John Doe",
  "first_name" => "John",
  "last_name" => "Doe",
  "website" => "http://www.example.com"
}
TWITTER_INFO = {
  "id" => "12345",
  "email" => "user@example.com",
  "name" => "John Doe",
  "first_name" => "John",
  "last_name" => "Doe",
  "nickname" => "Johny",
  "website" => "http://www.example.com"
}

Before("@omniauth_test") do
  OmniAuth.config.test_mode = true

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:facebook] = {
      "uid" => "12345",
      "provider" => "facebook",
      "user_info" => { "nickname" => "Johny" },
      "credentials" => { "token" => "exampletoken" },
      "extra" => { "user_hash" => FACEBOOK_INFO }
  }
  OmniAuth.config.mock_auth[:twitter] = {
      "uid" => "12345",
      "provider" => "twitter",
      "user_info" => TWITTER_INFO,
      "credentials" => { "token" => "exampletoken" },
  }
end

After("@omniauth_test") do
  OmniAuth.config.test_mode = false
end
