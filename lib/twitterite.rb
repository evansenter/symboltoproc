class Twitterite < TwitterOAuth::Client
  def initialize(access_keys = {})
    super({ :consumer_key => ENV["CONSUMER_KEY"], :consumer_secret => ENV["CONSUMER_SECRET"] }.merge(access_keys))
  end
  
  def self.request_token(return_url)
    token = new.request_token(:oauth_callback => return_url)
    p "self.request_token"
    p token
    token
  end
end