# encoding: utf-8
require 'rubygems'
require 'parse_kw_position'

class Position

  def initialize(search_engine)
    @parse_kw_position = ParseKwPosition.new(search_engine) 
  end

  def get_position(keyword, domain_name)
    kw_info = @parse_kw_position.get_kw_info(keyword, domain_name)

    parse_position_str(kw_info)
  end

  def parse_position_str(position_str)
    result = []
    position_str.each do |str_position|
      result << string2position(str_position[1])
    end
    result[0]
  end

  def string2position(str_position)
    a = /[\d]+/.match(str_position)
    [a.pre_match, a[0]]
  end

end