# encoding: utf-8
require 'rubygems'
require 'debugger'
require 'position'

class BidToPosition
  attr_accessor :key_word, :search_engine, :domain_name
  attr_accessor :exp_position, :exp_number
  attr_accessor :cur_position, :cur_number
  attr_accessor :hightest_price, :modify_times
  
  def initialize(search_engine, exp_position, exp_number, key_word, domain_name)
    @search_engine = search_engine
    @position      = Position.new(search_engine)

    set_expect_position(exp_position, exp_number)
    set_search_information(key_word, domain_name)
  end

  def set_expect_position(exp_position, exp_number)
    @exp_position = exp_position
    @exp_number   = exp_number
  end

  def set_search_information(key_word, domain_name)
    @key_word    = key_word
    @domain_name = domain_name
  end

  def regulate_position
    if eq_exp_position?
      return "do not to regulate position"
    else
      process_position
    end
  end
  
  def check_current_position
    position      = @position.get_position(@key_word, @domain_name)
    @cur_position = position[0]
    @cur_number   = position[1]

    position_log
  end
      
  def process_position

    if @cur_number > @exp_number
      reduce_price
    elsif @cur_number < @exp_number
      increase_price
    else
      return "current position is equal expect position"
    end

  end

  def reduce_price
  end

  def increase_price
  end

  def eq_exp_position?
    ([@cur_position, @cur_number] == [@exp_position, @exp_number]) ? true : false
  end

end