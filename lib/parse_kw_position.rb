# encoding: utf-8
require 'rubygems'
require 'nokogiri'
require 'uri'
require 'open-uri'
require 'debugger'

class ParseKwPosition

  def initialize(se_url)
    @se_url = se_url
    @html   = nil
  end

  def get_html_from_se(keyword)
    uri = "#{@se_url}#{keyword}"

    @html = Nokogiri::HTML(open(URI.escape uri))
    # @html = Nokogiri::HTML(File.open("/Users/john/workspaces/bid_to_position/yurongfu.html"))
  end

  def test_html_spec
    @html = Nokogiri::HTML(File.open("/Users/john.zhao/workspaces/bid_to_position/yurongfu.html"))
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

  def sponsors_array
    p top_sponsor.compact + bottom_sponsor.compact + right_sponsor
  end

  def get_kw_info(keyword, domain_name)
    get_html_from_se(keyword)

    result = []
    sponsors_array.each do |array|
      result << array if array[1] == domain_name
    end

    result
  end

end

