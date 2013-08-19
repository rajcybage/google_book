require_relative 'uri.rb'
require_relative 'book_shelf_item.rb'
class BookShelves
  include GoogleBook
  include URI
  attr_accessor :user_id, :uri, :items

  def initialize(user_id, item = nil)
    @user_id = user_id
    @uri = "https://www.googleapis.com/books/v1/users/#{user_id}/bookshelves"
    response = URI::Uri.new(URI(@uri)).response
    unless response.body.nil? || JSON.parse(response.body)["items"].nil?
      @items ||= JSON.parse(response.body)["items"].inject([]) do |result,item|
        result << item
        result
      end
    end
  end

  def bookshelves
    @book_shelf_items = []
    @items.each do |item|
      @book_shelf_items << BookShelfItem.new(item: item)
    end
    return @book_shelf_items
  end
  
end