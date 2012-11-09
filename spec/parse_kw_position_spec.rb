# encoding: utf-8
require 'rubygems'
require 'parse_kw_position'

describe ParseKwPosition, "ParseKwPosition test" do

  it "initialize a new parse_kw_position with keyword and url" do
    pkwp = ParseKwPosition.new("http://www.google.com")
    pkwp.should_not eq(nil)
  end

  it "should get html from search engine with keyword" do
    pkwp = ParseKwPosition.new("http://www.sogou.com/web?query=")
    pkwp.get_html_from_se("yurongfu").should_not eq(nil)
  end

  it "should get position with the keyword" do
    pkwp = ParseKwPosition.new("http://www.sogou.com/web?query=")
    pkwp.get_kw_info("羽绒服", "www.dahongbao.com").should_not eq(nil)
  end

  it "sholud get array with top and bottom sponsor" do
    pkwp = ParseKwPosition.new("http://www.sogou.com/web?query=")
    pkwp.get_html_from_se("yurongfu")
    pkwp.sponsors_array
  end

end