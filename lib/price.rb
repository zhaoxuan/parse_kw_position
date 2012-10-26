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
      return increase_price(0.1)

    when -1
      return reduce_price(0.1)

    when 'over times'
      return 'attempts over times'

    else
      return 'no to change'

    end
  end

  def judge_price
    (@history.length <= 10) ? (@history.last['range'] <=> @exp_position) : 'over times'
  end

  def change_price(range)
    (@history.last['price'].to_f * range.to_f).round(2)
  end

  def increase_price(change_range)

    if history_large_two?

      last_history     = @history.pop
      last_two_history = @history.pop

      if last_two_history['range'] < @exp_position
        return average_price(last_history['price'], last_two_history['price'])
      else
        return calculate_price(last_history['price'], 1 + change_range)
      end
    else
      calculate_price(@history.last['price'], 1 + change_range)
    end
    
  end

  def reduce_price(change_range)


    if history_large_two?
      last_history     = @history.pop
      last_two_history = @history.pop

      if special_calculate?(last_two_history)
        return average_price(last_history['price'], last_two_history['price'])
      else
        return calculate_price(last_history['price'], 1 - change_range)
      end

    else
      return calculate_price(@history.last['price'], 1 - change_range)
    end


  end

  def special_calculate?(last_two_history)
    last_two_history['range'] > @exp_position ? true : false
  end

  def history_large_two?
    @history.length >= 2 ? true : false
  end

  def calculate_price(price, price_range)
    (price.to_f * price_range.to_f).round(2)
  end

  def average_price(price1, price2)
    ((price1.to_f + price2.to_f)/2).round(2)
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