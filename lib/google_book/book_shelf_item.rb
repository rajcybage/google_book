require_relative 'book_info.rb'
require_relative 'base.rb'
require_relative 'uri.rb'

class BookShelfItem
  attr_accessor :item

  def initialize(item)
    @item = item
  end


  def title
    @item[:item]["title"]
  end

  def self_link
    @item[:item]["selfLink"]
  end

  def books
    uri = @item[:item]["selfLink"] + "/volumes"
    response = URI::Uri.new(URI(uri)).response
    @book_items = JSON(response.body)["items"]
    @books = []
    @book_items.each do |item|
      @books << BookItem.new(item: item)
    end
    return @books
  end
end