# encoding: utf-8
require 'rubygems'
require 'debugger'
require 'parse_kw_position'

class GetPosition

  def initialize(search_engine)
    @parse_kw_position = ParseKwPosition.new(search_engine) 
  end

  def get_position(keyword, domain_name)
    kw_info = @parse_kw_position.get_kw_info(keyword, domain_name)

    kw_info.each do |str_posiion|
      string2position str_posiion
    end

  end

  def string2position(str_posiion)
    a = /[\d]+/.match(str_posiion)
    [a.pre_match, a[0]]
  end

end