require_relative 'imdb_api'

class WhatToWatchController
  def initialize(api_key)
    @api = ImdbApi.new(api_key)
  end

  def on_theaters
    @api.on_theaters
  end

  def trailer(title)
    @api.trailer(title)
  end

  def coming_soon
    @api.coming_soon
  end

  def recommend(title)
    @api.recommendations(title)
  end
end
