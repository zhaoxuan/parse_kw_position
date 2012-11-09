# encoding: utf-8
require 'rubygems'
require 'mechanize'
require File.expand_path('../position',__FILE__)

class Crawler

  def search_keyword(keyword)
    # Nokogiri::HTML(open(URI.escape "http://www.sogou.com/web?query=#{keyword}"))
    @agent                  = Mechanize.new
    debugger
    @agent.user_agent_alias = 'Mac Safari'

    home_page = @agent.get('http://www.sogou.com/')
    search_form = home_page.form('sf')
  end

  def get_array_position(name)
    position = Position.new(search_keyword(name))
    position.sponsors_array
  end

  def compact_position(array)
    a = array.map do |item|
      item[2]
    end
  end

  def get_position(name)
    @position_array = get_array_position(name)
    @position_array.each do |item|
      if name == item[1]
        return item
      end
    end
  end

  def analyze(name, job_id)
    get_array_position(name)
  end

  
end