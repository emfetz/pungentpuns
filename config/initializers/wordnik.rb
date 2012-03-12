Wordnik.configure do |config|
  config.api_key = '1e0b77252b1967d2be10e0b78af0d0a175b17d2c2966f9e6c'               # required
  # config.username = ''               # optional, but needed for user-related functions
  # config.password = ''               # optional, but needed for user-related functions
  config.response_format = 'xml'      # defaults to json, but xml is also supported
  config.logger = Rails.logger         # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end