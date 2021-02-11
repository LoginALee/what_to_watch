# frozen_string_literal: true

require 'colorize'
require_relative 'what_to_watch/version'
require_relative 'what_to_watch/controller'

class WhatToWatch
  def initialize(api_key)
    @controller = WhatToWatchController.new(api_key)
  end

  def start(title = true)
    print_title if title
    print_menu
    evaluate_input(gets.chomp)
    start(false)
  end

  def print_menu
    puts(<<-MENU)
  Type the #{'name'.yellow} of a serie or movie to get recommendations.
  Type #{'what'.yellow}'#{'s on the theaters'.yellow} to get the movies in the teaters.
  Type #{'trailer + movie name'.yellow} to get the link to the trailer.
  Type #{'coming soon'.yellow} to get upcoming movies.
  Type #{'Q'.red} to quit.
    MENU
    puts
  end

  def print_title(title = 'W H A T  T O  W A T C H')
    puts
    puts("    #{title}")
    puts
  end

  def evaluate_input(input_text)
    delete_menu
    case input_text
    when 'Q'
      exit
    when /^what'*s on the theaters$/
      results = @controller.on_theaters
      print_title("What's on theaters")
    when /^trailer .*/
      input_text.gsub!('trailer', '')
      results = @controller.trailer(input_text)
      print_title("Trailer #{input_text}")
    when /^coming soon$/
      results = @controller.coming_soon
      print_title('Coming soon movies')
    when /[0-9a-zA-Z\s]/
      results = @controller.recommend(input_text)
      print_title("Recommendations")
    else
      results = 'Invalid command.'
    end
    print_result(results)
  end

  def print_result(results)
    if results.is_a?(String)
      puts(results)
    else
      results.each do |result|
        puts(result['title'])
      end
    end
    puts
  end

  def delete_menu
    system('clear')
  end
end
