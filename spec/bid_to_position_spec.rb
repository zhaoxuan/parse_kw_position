# encoding: utf-8
require 'rubygems'
require 'bid_to_position'

describe BidToPosition, "BidToPosition test" do

  it "should initialize a bid_to_position instance" do
    btp = BidToPosition.new("http://www.sogou.com/web?query=",
      'exp_position',
      'exp_number',
      'key_word',
      'domain_name' )
    btp.should_not eq(nil)
    btp.class.should eq(BidToPosition)
  end

  it "should begin to work, if position equal exp_position return true" do
    btp = BidToPosition.new("http://www.sogou.com/web?query=",
      'sogou_sponsor_',
      '1',
      'key_word',
      'domain_name' )
    btp.regulate_position.should eq("do not to regulate position")
  end

  it "process the position, if position not equal exp_position return false" do
    btp = BidToPosition.new("http://www.sogou.com/web?query=",
      'sogou_sponsor_',
      '2',
      'key_word',
      'domain_name' )
    btp.regulate_position.should_not eq(true)
  end
  
end