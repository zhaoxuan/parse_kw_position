# encoding: utf-8
require 'rubygems'
require 'debugger'
require 'price'
require 'position'

class BidToPosition

  def change_price
    price = Price.new('search_engine', 'exp_position', 'exp_number', 'key_word', 'domain_name')
  end
end