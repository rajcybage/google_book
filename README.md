<html>
<head>
<title>Google Book API Integration</title>
</head>
<body>
	<h1>Google Book ApI Integration</h1>
	<br/>
<div>
	<h2>Installation</h2>
	<p>In Gemfile
    <code>gem 'google_book'</code>
    or
    <code>gem install google_book</code>
	</p>
</div>
<div>
 <h2>System Requirements</h2>
 <code>Ruby >= 1.9.3 or jruby >=1.7.x</code>
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
   <li> type=1 ===> intitle: Returns results where the text following this keyword is found in the title.</li>
   <li> type=2  ===> inauthor: Returns results where the text following this keyword is found in the author.</li>
   <li> type=3 ====> inpublisher: Returns results where the text following this keyword is found in the publisher.</li>
   <li>type=4 ===> subject: Returns results where the text following this keyword is listed in the category list of the volume.</li>
   <li>type=5 ====>isbn: Returns results where the text following this keyword is the ISBN number.</li>
   <li>ltype=6 ====> ccn: Returns results where the text following this keyword is the Library of Congress Control Number.</li>
   <li>type =7 ===> oclc: Returns results where the text following this keyword is the Online Computer Library Center number.
   </li>
  </ul>
  <p>
   <code>b=GoogleBook::Book.new(:api_key => "YOUR_GOOOGLE_API_KEY")</code> <br/>
   <code> b.search("Name of the book you want to search",1)</code> <br/> 
   <code>b.book_info.get_all_titles #to get the all titles of your search book</code> <br/> 
   <code>b.book_info.get_all_subtitles # to get all the subtitles of your search book</code>
   
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

    <h3>Many other new functionalities are comming soon.....</h3>
</body>
</html>
