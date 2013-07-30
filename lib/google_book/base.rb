require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require_relative 'book_info.rb'

module GoogleBook
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE	
API_KEY = "AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM"
 class Book
   attr_accessor :total_count, :items
 
   def search(query,type = nil)
   	checking_type(type)
   	type = set_type(type) unless type.nil?
   	if query.nil?
      puts 'Enter the text to search'
      text = gets 
   	end	
   	puts JSON.parse(connect_google("AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM",type,query))
   	@total_count = JSON.parse(connect_google("AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM",type,query))["totalItems"]
   	@items = JSON.parse(connect_google("AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM",type,query))["items"]
   end	
    
   def book_info
   	  BookInfo.new(items: @items)
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
      puts "7)By Online Computer Library Center number"
      type = gets
    else
      type = "1"  
    end
   end	

   def set_type(type)
   	puts type
    case type.to_i
      when 1
        type = "intitle"
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
      else
        type =  "intitle"          
    end 
    return type
   end

   def url_formation(api_key,type,search_param)
      url = "https://www.googleapis.com/books/v1/volumes?q=#{search_param}+#{type}:keyes&key=#{api_key}"
      puts "#{url}"
      return URI(url)
   end	

   def connect_google(key,type,search_param)
    uri = url_formation(key,type,search_param)
    response = Net::HTTP.get_response(uri)
    return response.body
   end
 end 
end