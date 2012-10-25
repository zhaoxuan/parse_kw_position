#encoding: utf-8
require 'rubygems'
require 'debugger'

class Price
  attr_accessor :exp_position, :exp_number
  attr_accessor :cur_position, :cur_number, :cur_price
  attr_accessor :change_times, :arr_position
  attr_accessor :highest_price, :range
  
  def initialize(history, exp_position)
    @history     = history
    @exp_position = exp_position
  end

  def handle
    case judge_price
    when 1
      return change_price(1.1)
    when -1
      return change_price(0.9)
    else
      return 'no to change'
    end
  end

  def judge_price
    @history.last['range'] <=> @exp_position
  end

  def change_price(range)
    (@history.last['price'].to_f * range.to_f).round(2)
  end





  def is_match_condition?
    (change_times < 10 ? true : false) && has_ad_position?
  end

  def whether_modify_price?
    ([@cur_position, @cur_number] == [@exp_position, @exp_number]) ? false : true
  end

  def modify_price
    @change_times += 1
    if @cur_number > @exp_number
      return reduce_price
    elsif @cur_number < @exp_number
      return increase_price
    else
      return "current position is equal expect position"
    end
  end

  def reduce_price
    @cur_price * (1 - @range)
  end

  def increase_price
    @cur_price * (1 - @range)
  end

  def has_ad_position?
    @arr_position.include?(@exp_position)
  end

  def set_expect_position(exp_position, exp_number)
    @exp_position = exp_position
    @exp_number   = exp_number
  end

  def set_current(cur_position, cur_number, cur_price)
    @cur_position = cur_position
    @cur_number   = cur_number
    @cur_price    = cur_price
  end

  def set_regulation(change_times, highest_price, arr_position, range)
    @change_times  = change_times
    @highest_price = highest_price
    @arr_position  = arr_position 
    @range         = range
  end



end