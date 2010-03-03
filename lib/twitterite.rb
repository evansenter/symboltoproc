class Twitterite < TwitterOAuth::Client
  def initialize(access_keys = {})
    super({ :consumer_key => ENV["CONSUMER_KEY"], :consumer_secret => ENV["CONSUMER_SECRET"] }.merge(access_keys))
  end
  
  def self.request_token(return_url)
    new.request_token(:oauth_callback => return_url)
  end
end