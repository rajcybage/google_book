<html>
<head>
<title>Google Book API Integration</title>
</head>
<body>

<div>
<a href = "https://codeclimate.com/repos/51fa3a5356b102601a00d3e1/feed"><img src="https://codeclimate.com/repos/51fa3a5356b102601a00d3e1/badges/8db2d24d585c3d2ac1f1/gpa.png" /></a>
</div>

<h1>Google Book ApI Integration</h1><br/>
<p>You can use it in your web application as well as desktop application to fetch google books</p>
<div>
   <h2>Installation</h2>
    <p>In Gemfile
    <code>gem 'google_book', git: 'git@github.com:rajcybage/google_book.git'</code>
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
   <code>b.total_count #get the search results count</code>
   </p>


</div>

<h2>If you want to access each and every book as an instance of book</h2>
<p>you can then create a instance of books which was getting by search by following ways</p>
<div>
   <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code> <br/>
   <code> b.search("Name of the book you want to search",1)</code> <br/>
   <code>b.books #create the instance of all the books of your search</code><br/>
   <code>b.books.first.get_title #get the first book title</code><br/>
   <code>b.books.first.get_sub_title#get the first book sub title</code><br/>
   <code>b.books.first.authors #get the first book authors</code><br/>
   <code>b.books.first.publish_date #get the first book published date</code><br/>
   <code>b.books.first.preview_link #get the first book preview link</code><br/>
   <code>b.books.first.info_link #get the first book information</code><br/>
   <code>b.books.first.thumbnail_image #get the first book thumbnail image</code><br/>
   <code>b.books.first.small_thumbnail_link #get the first book thumbnail image</code><br/>
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
    <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code><br/>
    <code>b.filter('ruby language', 1)#here one is <b>filter_type</b> as defined above</code><br/>
    <span>Now create all books instance as usual</span><br/>
    <code>b.books</code>
    <span><b>If you select your filter as free ebook then it will be downloadable and buyable</b></span><br/>
    
    <code>b.books.first.downloadable?#check whther the book is downloadable</code><br/>
    <code>b.books.first.buyable?#check whether the book is buyable</code><br/>
    <code>b.books.first.buy_link</code><br/>
    <code>b.books.first.download_link</code>
 
  </div>
</p>


</body>
</html>
