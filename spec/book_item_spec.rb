require_relative '../lib/google_book/base.rb'
require_relative '../lib/google_book/book_item.rb'
require_relative 'spec_helper.rb'

describe "book_item" do
  let(:api_key){"AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM"}
  before(:all) do
    @con_book = GoogleBook::Book.new(:api_key => api_key)
    @con_book.search("Flowers",2)
    @book_items = @con_book.books
  end

  describe "initialize" do
    it "should have same instance" do
      @book_items.first.should be_a_kind_of(Object)
      @book_items.first.item[:item]["id"].should eq(BookItem.new(item: @con_book.search("Flowers",2).first).item[:item]["id"])
    end
  end

  describe "get_title" do
    it "should return proper title" do
      @book_items.first.get_title.should eq(@book_items.first.item[:item]["volumeInfo"]["title"])
    end
  end

  describe "get_sub_title" do
    it "should return proper subtitle" do
      @book_items.first.get_sub_title.should eq(@book_items.first.item[:item]["volumeInfo"]["subtitle"])
    end
  end

end