# encoding: utf-8
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class ParseKwPosition

  def initialize(se_url)
    @se_url = se_url
    @html   = nil
  end

  def get_html_from_se(keyword)
    @html = Nokogiri::HTML(open("#{@se_url}#{keyword}"))
  end

  def test_html_spec
    @html = Nokogiri::HTML('')
  end

  def top_and_bottom_sponsor
    a = []

    @html.xpath("//h3/a").each do |link|
      if !link.next_element.nil?
        a << [link.content, link['id'], link.next_element.content]
      end
    end
    a
  end

  def right_sponsor
    result = []

    @html.xpath('//div[@id="bdfs0"]').each do |link|
      temp = []

      link.children.each do |v|
        if v['class'] == 'fb' ||  v['class'] == 'pt '
          temp << v.children.first['id'] if v.children.first['id']
          temp << v.content.strip if v.content.nil?
        end
      end

      result << temp
    end
    result
  end

  def sponsors_array
    top_and_bottom_sponsor + right_sponsor
  end

  def get_kw_info(keyword, domain_name)
    get_html_from_se(keyword)

    result = []
    sponsors_array.each do |array|
      result << array if array[2] == domain_name
    end

    result
  end

end

