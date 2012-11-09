# encoding: utf-8
require 'rubygems'
require 'crawler'

describe Crawler, "crawler" do
  
  it "should get a search html" do
    crawler = Crawler.new
    crawler.search_keyword('羽绒服').class.should eq(Nokogiri::HTML::Document)
  end

  # it "should get an array with keyword from search engine" do
  #   crawler = Crawler.new
  #   result = crawler.analyze('羽绒服', '')
  #   p result
  #   result.class.should eq(Array)
  # end

  # it "should compact a position array to a string" do
  #   array = [
  #     ["新款羽绒服批发厂家直销、批发0.5折、100%退换货、..", "Hypfsc.Com", "sogou_sponsor_0"],
  #     ["2012新款羽绒服批发羽绒服批发批发,厂家直销,全场包..", "www.st80...", "sogou_sponsor_1"],
  #     ["女式长羽绒服秋冬新品上市", "www.dahongbao.com", "sogou_sponsor_2"],
  #     ["卡朱米 专注高档羽绒服", "kazhumi.tmall.com", "rleadad0"],
  #     ["子尚 高档 专柜羽绒服", "detail.taobao.com", "rleadad1"],
  #     ["天猫商城 正品羽绒服", "www.xmrjh.com", "rleadad2"],
  #     ["Tuomaifly高档羽绒服", "nfxd.taobao.com", "rleadad3"],
  #     ["2012新款服装批发,厂家直..", "www.weihaigou.com/", "rleadad4"],
  #     ["2012新款服装批发各种款式..", "www.788fzpf.com/", "rleadad5"],
  #     ["浪漫一身女款羽绒服(Yinta..", "Www.Yintai.Com", "rleadad6"],
  #     ["外贸服饰批发800元在家创..", "abc.79.net", "rleadad7"]
  #   ]

  #   crawler = Crawler.new
  #   crawler.compact_position(array).should eq(String)
  # end




end