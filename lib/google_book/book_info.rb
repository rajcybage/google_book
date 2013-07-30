require_relative 'base.rb'
require_relative 'book_item.rb'
class BookInfo 
  attr_accessor :items, :titles, :subtitles, :book
  
  def initialize(items=[])
    @items = items
  end	

  #return the all titles of those books 
  def get_all_titles
   	@titles = []
    @items[:items].each do |item|
      @titles << item["volumeInfo"]["title"]
      
    end
    return @titles	
  end
  
  #return all the subtitles

  def get_all_sub_titles
    @subtitles = []
    @items[:items].each do |item|
      @subtitles << item["volumeInfo"]["subtitle"]
    end
    return @subtitles	
  end 


  #return the particular book
  def get_book(params = {})
    item = @items.detect{|i| i[params.keys.first] == params.values.first} || @items.detect{|i| i["volumeInfo"][params.keys.first] == params.values.first}
    @book = BookItem.new(item: item)
  end
end