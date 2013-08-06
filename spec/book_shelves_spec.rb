require_relative "../lib/google_book/book_shelves.rb"
require_relative "spec_helper.rb"

describe "book_shelves" do
  let(:user_id){"109681907061774445744"}

  it "should create a book shelves instance with a user id of google" do
    BookShelves.new(user_id).items.should_not be_nil
    BookShelves.new(user_id).items.should be_a_kind_of(Array)
  end

  it "should not create the book selves instance items if user id is wrong" do
    BookShelves.new("10968190").items.should be_nil
  end

  it "should create a perfect url" do
    BookShelves.new(user_id).uri.should == "https://www.googleapis.com/books/v1/users/109681907061774445744/bookshelves"
  end


end


describe "bookshelves" do
  let(:user_id){"109681907061774445744"}
   before(:each) do
     @boook_shelves = BookShelves.new(user_id)
   end

   it "should create book shelves items" do
     @boook_shelves.bookshelves.should_not be_nil
     @boook_shelves.bookshelves.should be_a_kind_of(Array)
   end

end