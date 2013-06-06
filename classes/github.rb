require 'httparty'

#
# Simple class to interface to github REST interface
#

class GitHub
  include HTTParty

  base_uri 'https://api.github.com'
  basic_auth "your_username", "your_password"
end