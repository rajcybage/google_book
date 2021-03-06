require 'uri'
require 'net/http'
require 'openssl'
require 'json'

require_relative 'book_info.rb'
require_relative 'book_item.rb'
require_relative 'uri.rb'
module GoogleBook
  class Book
    include URI
    attr_accessor :api_key, :total_count, :items, :books

    def initialize(api_key)
      unless api_key.nil?
        @api_key = api_key[:api_key]
      else
        raise "Api key can not be nil. Please given your api_key"
      end
    end

    #Google books search
    def search(query,type = nil)
      checking_type(type)
      type = set_type(type) unless type.nil?
      if query.nil?
        puts 'Enter the text to search'
        text = gets
      end
      json = JSON.parse(connect_google(@api_key,type,query))
      @total_count = json["totalItems"]
      @items = json["items"]
    end

    #Google books filtration
    def filter(query, type = nil)
      checking_filter_type(type)
      filter_type = set_filter_type(type) unless type.nil?
      json = JSON.parse(connect_google(@api_key,nil,query,filter_type))
      @total_count = json["totalItems"]
      @items = json["items"]
    end

    #get all the books information
    def book_info
   	  BookInfo.new(items: @items)
    end

    #create all book instances
    def books
      @books = []
      @items.each do |item|
        @books << BookItem.new(item: item)
      end
      @books
    end
    
    def checking_filter_type(type)
      if type.nil?
        puts "How you want to filter your search?(example:1)?"
        puts "1)Free ebooks"
        puts "2)Paid ebboks"
        puts "3)Full text"
        f_type = gets
      else
        type = "1"
      end
    end


    def set_filter_type(type)
      case type.to_i
      when 1
        type = "free-ebooks"
      when 2
        type = "paid-ebooks"
      when 3
        type = "full"
      else
        type = "ebooks"
      end
    end

    
    def checking_type(type)
      if type.nil?
        puts "How you want to search?input only list number(ex:1)\n"
        puts "1)By Title\n"
        puts "2)By Author Name\n"
        puts "3)By Publisher\n"
        puts "4)By Subject\n"
        puts "5)By ISBN number:- \n"
        puts "6)Library of Congress Control Number\n"
        puts "7)By Online Computer Library Center number\n"
        puts "8)Want to search Downloadable book"
        puts "9)Want to search downloadable Magazines"
        type = gets
      else
        type = "1"
      end
    end

    def set_type(type)
      case type.to_i
      when 1
        type = nil
      when 2
        type = "inauthor"
      when 3
        type = "inpublisher"
      when 4
        type = "subject"
      when 5
        type = "isbn"
      when 6
        type = "lccn"
      when 7
        type = "oclc"
      when 8
        type = "download"
      when 9
        type = "magazine"
      else
        type =  "inauthor"
      end
      type
    end

    def url_formation(api_key = nil,type = nil,search_param = nil, filter = nil)
      main_url = "https://www.googleapis.com/books/v1/volumes"
      if !type.nil?
        url = set_normal_url(api_key, type, search_param, main_url)
      elsif type.nil? && !filter.nil?
        url = main_url+"?q=#{search_param.gsub(/\s+/, "+").strip}&filter=#{filter}"
      else
        url = main_url+"?q=#{search_param.gsub(/\s+/, "+").strip}"
      end
      puts "#{url}"
      url = url + "&maxResults=40"
      URI(url)
    end

    def set_normal_url(api_key, type, search_param, main_url)
      case type
      when "download"
        url = main_url+"?q=#{search_param.gsub(/\s+/, "+").strip}&download=epub"
      when "magazine"
        url = main_url+"?q=#{search_param.gsub(/\s+/, "+").strip}&printType=magazines"
      else
        url = main_url+"?q=#{search_param.gsub(/\s+/, "").strip}+#{type}"
      end
      url + "&maxResults=40"
    end

    def connect_google(key = nil,type = nil,search_param = nil,filter = nil)
      uri = url_formation(key,type,search_param,filter)
      uri=URI::Uri.new(uri)
      #      response = Net::HTTP.get_response(uri)
      uri.response.body
    end
  end
end
