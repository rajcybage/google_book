require 'rspec'
require 'rspec/expectations'
require 'rspec/mocks'
require 'rspec/core'
require_relative '../lib/google_book/base.rb'
require_relative 'spec_helper.rb'

describe "base" do
  let(:api_key){"AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM"}
  before(:all) do
    @con_book = GoogleBook::Book.new(:api_key => api_key)
  end

  describe "initialize" do
    it "should connect googlebook api properly" do
      @con_book.should_not be_nil
      @con_book.should be_a_kind_of(Object)
    end
  end

  describe "search" do
    it "should  return anything without type" do
      @con_book.search('Flowers').should_not be_nil
      @con_book.search('Flowers').should be_a_kind_of(Array)
    end
   
  end
end