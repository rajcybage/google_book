require_relative 'book_info.rb'
require_relative 'base.rb'

class BookShelves
  include GoogleBook
  attr_accessor :user_id, :uri, :items

  def initialize(user_id, item = nil)
    @user_id = user_id
    @uri = "https://www.googleapis.com/books/v1/users/#{user_id}/bookshelves"
    @items=JSON.parse(GoogleBook::Book.connect_uri(URI(@uri)).body)["items"].inject([]) do |result,item|
      result << item
      result
    end
  end
end