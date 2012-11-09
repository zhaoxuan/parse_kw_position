# encoding: utf-8
require 'rubygems'
require 'nokogiri'
require 'uri'
require 'open-uri'
require 'debugger'

class Position

  def initialize(html)
    @html = html
  end

  def sponsors_array
    top_sponsor.compact + bottom_sponsor.compact + right_sponsor.compact
  end

  def top_sponsor
    @html.xpath('//*[@id="promotion_adv_container"]/ol').children.map do |link|
      [link.children[1].children[1].text, link.children[1].children[3].text, link.children[1].children[1]['id']] unless link.text.strip.empty?
    end

  end

  def right_sponsor
    @html.xpath('//div[@id="bdfs0"]').map do |link|
      [link.children[1].text.strip, link.children[4].text.strip, link.children[1].children[1]['id'] ]
    end
  end

  def bottom_sponsor
    @html.xpath('//*[@id="main"]/div[3]/ol').children.map do |link|
      [link.children[1].children[1].text, link.children[1].children[3].text, link.children[1].children[1]['id']] unless link.text.strip.empty?
    end
  end

end

