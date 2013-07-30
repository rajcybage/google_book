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

end