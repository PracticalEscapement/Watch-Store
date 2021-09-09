require 'taxjar'

TAXJAR_API = Taxjar::Client.new(api_key: ENV["TAXJAR_API_KEY"])
