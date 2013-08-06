require_relative "../lib/google_book/book_shelves.rb"
require_relative "spec_helper.rb"

describe "book_shelf_item" do
  let(:user_id){"109681907061774445744"}

  before(:all) do
    @book_shelve = BookShelves.new(user_id)
    @bookshelves_items = @book_shelve.bookshelves
  end

  it "should return right book shelf of the corresponding user" do
    @bookshelves_items.first.title.should_not be_nil
    @bookshelves_items.first.title.should ==  "Favorites"
  end

  it "shouldreturn the right book shelf self link" do
    @bookshelves_items.first.self_link.should_not be_nil
    @bookshelves_items.first.self_link.should == "https://www.googleapis.com/books/v1/users/109681907061774445744/bookshelves/0"
  end
end

describe "books" do
  let(:user_id){"109681907061774445744"}

  before(:all) do
    @book_shelve = BookShelves.new(user_id)
    @bookshelves_items = @book_shelve.bookshelves
    @books = @bookshelves_items.first.books
  end

  it "should show the right books data of a bookshelf" do
    @books.should_not be_nil
    @books.should be_a_kind_of(Array)
    @books.first.get_title.should == "Complete Adventures of Feluda"
  end
end