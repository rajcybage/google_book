require_relative 'book_info.rb'
require_relative 'base.rb'
require_relative 'uri.rb'

class BookShelves
  include GoogleBook
  include URI
  attr_accessor :user_id, :uri, :items

  def initialize(user_id, item = nil)
    @user_id = user_id
    @uri = "https://www.googleapis.com/books/v1/users/#{user_id}/bookshelves"
    response = URI::Uri.new(URI(@uri)).response
    @items = JSON.parse(response.body)["items"].inject([]) do |result,item|
      result << item
      result
    end
  end
end