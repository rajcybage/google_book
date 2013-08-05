require_relative 'book_info.rb'
require_relative 'base.rb'

class BookItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

 # get the title of the book
  def get_title
    @item[:item]["volumeInfo"]["title"]
  end

  #get the sub title of the book
  def get_sub_title
    @item[:item]["volumeInfo"]["subtitle"]
  end

  #the authors(s) of the book
  def authors
    @item[:item]["volumeInfo"]["authors"]
  end

  #The published date of the book
  def publish_date
    @item[:item]["volumeInfo"]["publishedDate"]
  end

  #The preview link
  def preview_link
    @item[:item]["volumeInfo"]["previewLink"]
  end

  #Information link
  def info_link
    @item[:item]["volumeInfo"]["infoLink"]
  end

  #canonical volume link
  def canonical_volume_link
    @item[:item]["volumeInfo"]["canonicalVolumeLink"]
  end

  #thumbnail images
  def thubnail_image
    @item[:item]["volumeInfo"]["imageLinks"]["thumbnail"]
  end

  #small thumbnail images
  def small_thumbnail_link
    @item[:item]["volumeInfo"]["imageLinks"]["smallThumbnail"]
  end

  #total pages
  def pagecount
    @item[:item]["volumeInfo"]["pageCount"]
  end

  #web reader link
  def web_reader_link
    @item[:item]["accessInfo"]["webReaderLink"]
  end

 #text snippet description
  def text_snippet_description
   @item[:item]["searchInfo"]["textSnippet"] unless @item[:item]["searchInfo"].nil?
  end

  #the rating of the book
  def rating
    @item[:item]["volumeInfo"]["averageRating"]
  end

  #the total count of the rating
  def total_rating
    @item[:item]["volumeInfo"]["ratingsCount"]
  end

  #publisher
  def publisher
    @item[:item]["volumeInfo"]["publisher"]
  end

  #publish date
  def publish_date
    @item[:item]["volumeInfo"]["publishedDate"]
  end

  #the buy link of the book
  def buy_link
    if buyable?
      @item[:item]["saleInfo"]["buyLink"]
    else
      "your book is not buyable"
    end
  end

  #check whether it is magazine or not
  def magazine?
    if @item[:item]["volumeInfo"]["printType"].upcase == "MAGAZINE"
      true
    else
      false
    end
  end

  #The price of the book
  def price
    @item[:item]["saleInfo"]["listPrice"]["amount"].to_s + ' ' + @item[:item]["saleInfo"]["listPrice"]["currencyCode"] unless @item[:item]["saleInfo"]["listPrice"].nil?
  end

  #check whether the book is download able or not
  def downloadable?
    unless @item[:item]["accessInfo"]["pdf"].nil? || @item[:item]["accessInfo"]["pdf"]["downloadLink"].nil?
      true
    else
      false
    end
  end

  #check whether the book is buy able or not
  def buyable?
    if @item[:item]["saleInfo"]["isEbook"] != true ||  @item[:item]["saleInfo"]["buyLink"].nil?
      false
    else
      true
    end
  end

  #the download link of the book
  def download_link
    if downloadable?
      @item[:item]["accessInfo"]["pdf"]["downloadLink"]   
    else
      "your book is not downloadable"
    end
  end
end