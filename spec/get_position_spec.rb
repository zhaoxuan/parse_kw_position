# encoding: utf-8
require 'rubygems'
require 'get_position'

describe GetPosition, "" do
  
  # it "get a new get_position with search engine" do
  #   get_position = GetPosition.new("http://www.google.com")
  #   get_position.should_not eq(nil)
  # end

  # it "get the position from search engine, such as top 1, top 2 and so on" do
  #   kw_info = GetPosition.new("http://www.sogou.com/web?query=")
  #   kw_info.should_not eq(nil)
  #   kw_info.get_position("yurongfu", "www.dahongbao.com")
  # end

  it "should get a sponsor position and number from a string" do
    gp       = GetPosition.new("http://www.sogou.com/web?query=")
    position = gp.string2position('sogou_sponsor_1')

    position.should_not eq(nil)
    position.class.should eq(Array)
    position.should eq(['sogou_sponsor_', '1'])

  end

  it "should get a sogou_bottomblue position and number from a string" do
    gp        = GetPosition.new("http://www.sogou.com/web?query=")
    position = gp.string2position('sogou_bottomblue_21')

    position.should_not eq(nil)
    position.class.should eq(Array)
    position.should eq(['sogou_bottomblue_', '21'])

  end

  it "should get a rleadad position and number from a string" do
    gp       = GetPosition.new("http://www.sogou.com/web?query=")
    position = gp.string2position('rleadad0')

    position.should_not eq(nil)
    position.class.should eq(Array)
    position.should eq(['rleadad', '0'])
  end
  
end