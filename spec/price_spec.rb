# encoding: utf-8
require 'rubygems'
require 'price'

describe Price, "price test" do
  
  it "if current position equal expect position, return 'no to change' " do
    history = [{'range' => '4', 'price' => '5'}, {'range' => '3', 'price' => '5.5'}]
    price = Price.new(history, '3')
    price.handle.should eq('no to change')
  end

  it "if current position less than expect postion, return an increase price" do
    history = [{'range' => '4', 'price' => '5'}, {'range' => '3', 'price' => '5.5'}]
    price = Price.new(history, '2')
    price.handle.should eq(6.05)
  end

  it "if current position more than expect postion, return an reduce price" do
    history = [{'range' => '3', 'price' => '5'}, {'range' => '2', 'price' => '5.5'}]
    price = Price.new(history, '3')
    price.handle.should eq(4.95)
  end

end