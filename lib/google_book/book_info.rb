require_relative 'base.rb'

class BookInfo 
  attr_accessor :items, :titles, :subtitles, :book
  @titles = []
  @subtitles = []
  def initialize(items=[])
    @items = items
  end	

  #return the all titles of those books 
  def get_all_titles
    show_all_titles_and_subtitles("title")
    return @titles
  end
  
  #return all the subtitles
  def get_all_sub_titles
    show_all_titles_and_subtitles("subtitle")
    return @subtitles
  end 


  #return the particular book
  def get_book(params = {})
    item = @items.detect{|i| i[params.keys.first] == params.values.first} || @items.detect{|i| i["volumeInfo"][params.keys.first] == params.values.first}
    @book = BookItem.new(item: item)
  end

  private
  def show_all_titles_and_subtitles(flag)
    @items[:items].inject do |item|
      @titles << item["volumeInfo"]["title"]
    end
  end

end