require_relative 'book_info.rb'
require_relative 'base.rb'

class BookItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def get_title
    @item[:item]["volumeInfo"]["title"]
  end

  def get_sub_title
    @item[:item]["volumeInfo"]["subtitle"]
  end

  def authors
    @item[:item]["volumeInfo"]["authors"]
  end

  def publish_date
    @item[:item]["volumeInfo"]["publishedDate"]
  end

  def preview_link
    @item[:item]["volumeInfo"]["previewLink"]
  end

  def info_link
    @item[:item]["volumeInfo"]["infoLink"]
  end

  def canonical_volume_link
    @item[:item]["volumeInfo"]["canonicalVolumeLink"]
  end

  def thubnail_image
    @item[:item]["volumeInfo"]["imageLinks"]["thumbnail"]
  end

  def small_thumbnail_link
    @item[:item]["volumeInfo"]["imageLinks"]["smallThumbnail"]
  end

  def pagecount
    @item[:item]["volumeInfo"]["pageCount"]
  end

  def web_reader_link
    @item[:item]["accessInfo"]["webReaderLink"]
  end

  def buy_link
    if buyable?
      @item[:item]["saleInfo"]["buyLink"]
    else
      "your book is not buyable"
    end
  end

  def magazine?
    if @item[:item]["volumeInfo"]["printType"].upcase == "MAGAZINE"
      true
    else
      false
    end
  end

  def downloadable?
    unless @item[:item]["accessInfo"]["pdf"].nil? || @item[:item]["accessInfo"]["pdf"]["downloadLink"].nil?
      true
    else
      false
    end
  end

  def buyable?
    if @item[:item]["saleInfo"]["isEbook"] != true ||  @item[:item]["saleInfo"]["buyLink"].nil?
      false
    else
      true
    end
  end

  def download_link
    if downloadable?
      @item[:item]["accessInfo"]["pdf"]["downloadLink"]   
    else
      "your book is not downloadable"
    end
  end
end