require_relative '../lib/google_book/base.rb'
require_relative '../lib/google_book/book_item.rb'
require_relative 'spec_helper.rb'

describe "base" do
  let(:api_key){"AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM"}
  before(:all) do
    @con_book = GoogleBook::Book.new(:api_key => api_key)
  end

  describe "google_connect" do
    it "should connect google book" do
      stub_request(:get, "https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=#{api_key}").to_return(:body => "abc")
    end
  end

  describe "initialize" do
    it "should connect googlebook api properly" do
      @con_book.should_not be_nil
      @con_book.should be_a_kind_of(Object)
    end
  end

  describe "search" do
    
    it "should  return anything type" do
      @con_book.search('flowers',2).should_not be_nil
      @con_book.search('flowers',2).should be_a_kind_of(Array)
    end
    
    it "should return all books items is eual to the items of the book object" do
      @con_book.search('Flowers',2).should eq @con_book.items
    end
  end

  describe "books" do
    before(:all) do
      @con_book.search('Flowers',2)
    end
    it "should create all the books instance" do
      @con_book.books.should be_a_kind_of(Array)
      @con_book.books.first.should be_a_kind_of(Object)
    end
  end
end