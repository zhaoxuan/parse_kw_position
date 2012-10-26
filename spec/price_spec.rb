# encoding: utf-8
require 'rubygems'
require 'price'

describe Price, "price test" do
  
  it "if current position equal expect position, return 'no to change' " do

    history = [{'range' => '4', 'price' => '5'},
               {'range' => '3', 'price' => '5.5'}]
    price   = Price.new(history, '3')

    price.handle.should eq('no to change')
  end

  it "if current position less than expect postion, return an increase price" do

    history = [{'range' => '4', 'price' => '5'},
               {'range' => '3', 'price' => '5.5'}]
    price   = Price.new(history, '2')

    price.handle.should eq(6.05)
  end

  it "if current position less than expect postion, return an increase price" do

    history = [{'range' => '4', 'price' => '5'},
               {'range' => '3', 'price' => '5.5'},
               {'range' => '2', 'price' => '6.05'}]
    price   = Price.new(history, '1')

    price.handle.should eq(6.66)
  end

  it "if current position less than expect postion, return an increase price" do

    history = [{'range' => '2', 'price' => '6.05'}]
    price   = Price.new(history, '1')

    price.handle.should eq(6.66)
  end

  it "if current position more than expect postion, return an reduce price" do

    history = [{'range' => '1', 'price' => '5'},
               {'range' => '2', 'price' => '4.5'}]
    price   = Price.new(history, '3')

    price.handle.should eq(4.05)
  end

  it "when current position is higher than expect position,
      it will reduce price to the position,
      but the laster position is under expect position,
      so it will get average price" do

    history = [ {'range' => '3', 'price' => '10'},
                {'range' => '1', 'price' => '11'}]
    price   = Price.new(history, '2')

    price.handle.should eq(10.5)

  end

  it "when current position is under than expect position,
      it will increase price to the posiont,
      but the laster position is highe expect position,
      so it will get average price " do

    history = [ {'range' => '1', 'price' => '10'},
                {'range' => '3', 'price' => '9'}]
    price   = Price.new(history, '2')

    price.handle.should eq(9.5)
  end

  it "when current position is higher than expect position,
      it will reduce price to the position,
      but the laster position is under expect position,
      so it will get average price" do

    history = [ {'range' => '4', 'price' => '10'},
                {'range' => '3', 'price' => '11'},
                {'range' => '1', 'price' => '12.1'}]
    price   = Price.new(history, '2')

    price.handle.should eq(11.55)

  end

  it "whether do special calculate, if history is equal or more than two do it" do

    history = [{'range' => '4', 'price' => '5'},
               {'range' => '3', 'price' => '5.5'}]
    price   = Price.new(history, '2')

    price.history_large_two?.should eq(true)
  end

  it "whether do special calculate, if not history is equal or more than two no do it " do

    history = [{'range' => '4', 'price' => '5'}]
    price   = Price.new(history, '3')
    price.history_large_two?.should eq(false)
  end

  it "if attempts over 10, return 'over times' " do

    history = [{'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'},
               {'range' => '4', 'price' => '5'}]
    price   = Price.new(history, '3')
    price.handle.should eq('attempts over times')
  end








end