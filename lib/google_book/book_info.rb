require_relative 'base.rb'
class BookInfo 
  attr_accessor :items, :titles, :subtitles
  
  def initialize(items=[])
    @items = items
  end	

  #return the all titles of those books 
   def get_titles
   	@titles = []
    @items[:items].each do |item|
      @titles << item["volumeInfo"]["title"]
    end
    return @titles	
   end
  
  #return all the subtitles

  def get_sub_tiitles
   @subtitles
   @items[:items].each do |item|
      @subtitles << item["volumeInfo"]["subtitle"]
    end
    return @subtitles	
  end 
  
end