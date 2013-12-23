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

  describe "authors" do
     it "should return perfect authors name" do
       @book_items.first.authors.should =~ ["Daniel Keyes"]
     end
   end

  describe "preview_link" do
    it "should return perfect preview link" do
      @book_items.first.preview_link.should == "http://books.google.com/books?id=_oG_iTxP1pIC&pg=PA224&dq=Flowers+inauthor:keyes&hl=&cd=1&source=gbs_api"
    end
  end

  describe "info_link" do
    it "should return perfect info link" do
      @book_items.first.info_link.should == "http://books.google.com/books?id=_oG_iTxP1pIC&dq=Flowers+inauthor:keyes&hl=&source=gbs_api"
    end
  end

  describe "version" do
    it "should return perfect version" do
      @book_items.first.version.should == "0.6.4.0.preview.3"
   end
  end

  describe "google_checkout_link" do
    it "should return perfect google checkout link" do
      @book_items.first.google_checkout_link.should == "https://play.google.com/store/books/details?id=_oG_iTxP1pIC&rdid=book-_oG_iTxP1pIC&rdot=1&source=gbs_atb"
    end
  end

  describe "rating" do
    it "should return the rating of the book" do
      @book_items.first.rating.should == 4.0
    end
  end

  describe "publisher" do
    it "should return right publisher name" do
      @book_items.first.publisher.should == "Houghton Mifflin Harcourt"
    end
  end

  describe "publish_date" do
    it "should return the perfect published date" do
      @book_items.first.publish_date.should == "2007-12-01"
    end
  end
end
