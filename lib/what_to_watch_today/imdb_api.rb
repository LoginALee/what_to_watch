require 'rest-client'
require 'json'

class ImdbApi
  BASE_URL = 'https://imdb-api.com/en/API/'

  def initialize(api_key)
    @api_key = api_key
    @options = { method: 'get' }
  end

  def recommendations(title)
    id = find_id(title)
    results = call('Title', id)
    results['similars'].first(5)
  end

  def trailer(title)
    id = find_id(title)
    results = call('Trailer', id)
    results['link']
  end

  def on_theaters
    results = call('InTheaters')
    results['items']
  end

  def coming_soon
    results = call('ComingSoon')
    results['items']
  end

  private

  def call(endpoint, identifier = nil)
    url = create_url(endpoint, identifier)
    response = RestClient::Request.new(
      method: @options[:method],
      url: url
    ).execute
    JSON.parse(response.to_str)
  end

  def find_id(title)
    id = call('SearchTitle', title)
    id['results'][0]['id']
  end

  def create_url(endpoint, identifier)
    title = identifier.gsub(' ', '%20') unless identifier.nil?
    "#{BASE_URL}#{endpoint}/#{@api_key}/#{title}"
  end
end
