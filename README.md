<html>
<head>
<title>Google Book API Integration</title>
</head>
<body>

<div>
 <a href = "https://codeclimate.com/repos/51fa3a5356b102601a00d3e1/feed"><img src="https://codeclimate.com/repos/51fa3a5356b102601a00d3e1/badges/8db2d24d585c3d2ac1f1/gpa.png" /></a>
 <a href = "https://travis-ci.org/rajcybage/google_book"><img src= "https://travis-ci.org/rajcybage/google_book.png?branch=master"/></a>
 <img src = "https://badge.fury.io/rb/google_book.png"/>
</div>

<h1>Google Book Api Integration For Books and Magazines and Book Shelves</h1><br/>
<p>Google Book API integration for fetching the information for google books and magazines and book shelves also filter them. You can eaisly get most of the elements for a particular book and magazine or the books of a book shelf from the google book search. like :-(title,sub title,preview link,authors,publisher,publish date,buylink,downloadlink,version,ISBN information,ratings,...many more..Also you can get the google checkout link for that book/magazine</p>
<div>
   <h2>Installation</h2>
    <p>In Gemfile<br/>
      <code>gem 'google_book', '0.3.9'</code>
    </p>
</div>
<div>
 <h2>System Requirements</h2>
 <code>Ruby >= 1.9.3 or jruby >=1.7.x</code>
 <code>rails >= 3.0.x</code>
</div> 

<div>
 <h2>Usage</h2>
 <p>
 <code>
   b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")
 </code><br/>
 <code>
   b.search("Name of the book you want to search",type) #type should be a number
 </code>
 </p>
  <ul>
   <li> type = 1 ===> intitle: Returns results where the text following this keyword is found in the title.</li>
   <li> type = 2  ===> inauthor: Returns results where the text following this keyword is found in the author.</li>
   <li> type = 3 ====> inpublisher: Returns results where the text following this keyword is found in the publisher.</li>
   <li>type = 4 ===> subject: Returns results where the text following this keyword is listed in the category list of the volume.</li>
   <li>type = 5 ====>isbn: Returns results where the text following this keyword is the ISBN number.</li>
   <li>ltype = 6 ====> ccn: Returns results where the text following this keyword is the Library of Congress Control Number.</li>
   <li>type = 7 ===> oclc: Returns results where the text following this keyword is the Online Computer Library Center number.
   <li> type = 8 ===> Returns the book which can be downloadable</li>
   </li>
  </ul>
  <p>
   <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code> <br/>
   <code> b.search("keyword or book name",1)</code> <br/> 
   <code>b.book_info.get_all_titles #to get the all titles of your search book</code> <br/> 
   <code>b.book_info.get_all_subtitles # to get all the subtitles of your search book</code>
   <code>b.total_count #get the search results count</code><br/>
  
   </p>


</div>

<h2>If you want to access each and every book as an instance of book</h2>
<p>you can then create a instance of books which was getting by search by following ways</p>
<div>
   <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code> <br/>
   <code> b.search("Name of the book you want to search",1)</code> <br/>
   <code>b.books #create the instance of all the books of your search</code><br/>
   <code><b>b.books.first.get_title #get the first book title</b></code><br/>
   <code><b>b.books.first.get_sub_title#get the first book sub title</b></code><br/>
   <code><b>b.books.first.authors #get the first book authors</b></code><br/>
   <code><b>b.books.first.text_snippet_description #get the first book text snippet description</b></code><br/>
   <code><b>b.books.first.publish_date #get the first book published date</b></code><br/>
   <code><b>b.books.first.publisher #get the first book publisher name</b></code><br/>
   <code><b>b.books.first.rating #get the rating of the book</b></code><br/>
   <code><b>b.books.first.total_rating #get the total rating count of the book</b></code><br/>
   <code><b>b.books.first.version #get the version of the book</b></code><br/>
   <code><b>b.books.first.preview_link #get the first book preview link</b></code><br/>
   <code><b>b.books.first.info_link #get the first book information</b></code><br/>
    <code><b>b.price #get the book price with currency</b></code><br/>
   <code><b>b.books.first.thumbnail_image #get the first book thumbnail image</b></code><br/>
   <code><b>b.books.first.small_thumbnail_link #get the first book thumbnail image</b></code><br/>
   <h2>If you want to access google checkout for a particular book we can get the link for checkout</h2>
   <code><b>b.books.first.google_checkout_link #get the first book direct google checkout</b></code><br/>
   <h2>Want ISBN Information</h2><br/>
   <code><b>b.books.first.ISBN_info #isbn info for first book it will return hash like {:ISBN_10 => "778545"}</b></code>
</div>




<h2>Want to search Downloadable Books</h2>
<p>
 <div>
   <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code> <br/>
   <code>b.search('downloadable book name',8)</code>
   <code>b.books.first.downloadable?#check whther the book is downloadable</code><br/>
   <code>b.books.first.buyable?#check whether the book is buyable</code><br/>
   <code>b.books.first.buy_link</code><br/>
   <code>b.books.first.download_link</code>
 </div>
</p>


<h2>Want to get Magazines only</h2>
<p>
<div>
   <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code> <br/>
   <code>b.search('downloadable book name',<b>9</b>) #type is 9 for only magazines</code>
   <code>b.books #create the magaize instances</code><br/>
   <code>b.books.first.magazine?</code><br/>
  <span> so on..now get all the info(title,subtitle,author,preview....) of each and every magazine instanaces as stated above</span>
</div>
</p>
<h2>Filter your Search</h2>
<p>
  <div>
    <ul>
      <li> filter_type = 1 free-ebooks - Only returns results that are free Google eBooks.</li>
      <li> filter_type = 2 paid-ebooks - Only returns results that are Google eBooks with a price.</li>
      <li> filter_type = 3 full - Only returns results where all of the text is viewable.</li>
      <li> filter_type = 4 ebooks - Only returns results that are Google eBooks, paid or free. 
      Examples of non-eBooks would be publisher content that is available in limited preview and not for sale, 
      or magazines.</li>
    </ul>
  </div>

  <div>
    <code>filter_book=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code><br/>
    <code>filter_book.filter('ruby language', 1)#here one is <b>filter_type</b> as defined above</code><br/>
    <span>Now create all books instance as usual</span><br/>
    <code>filter_book.books</code>
    <span><b>If you select your filter as free ebook then it will be downloadable and buyable</b></span><br/>
    
    <code>filter_book.books.first.downloadable?#check whther the book is downloadable</code><br/>
    <code>filter_book.books.first.buyable?#check whether the book is buyable</code><br/>
    <code>filter_book.books.first.buy_link</code><br/>
    <code>filter_book.books.first.download_link</code>
 
  </div>
</p>


<div>
  <h2>If You want to get the book shelves of a particular user</h2>
  <div>
    <b>
     <code>bs=BookShelves.new("GOGLE_BOOKS_USER_ID")</code><br/>
     <code>bs.bookshelves #all the book shelves of that user in a instance</code><br/>
     <code>bs.bookshelves.first.title #the title of the books shelve first</code><br/>
     <code>bs.bookshelves.first.self_link #the title of the books shelve first</code><br/>
    </b>
  </div>
  <p>
    <h2>If you want the books of a particular Book shelves</h2>
     <b><code>bs.bookshelves.first.books#get all the books of that book shelves</code></b><br/>
     <b><code>bs.bookshelves.first.books.first.get_title</code></b><br/>
     <b>Now you can access all the methods of those books(ex:-get_title,preview_link....etc) </b>
     
  </p>
</div>

</body>
</html>
