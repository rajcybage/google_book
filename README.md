<!DOCTYPE>
<html>
<head>
<title>Google Book API Integration</title>
</head>
<body>
	<h1>Google Book Api Integration</h1>
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
 <code>Ruby >= 1.9.3</code>
</div> 

<div>
 <h2>Usage</h2>
 <p>
 <code>
   b=GoogleBook::Book.new
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
   <code>b=GoogleBook::Book.new</code> <br/> 
   <code> b.search("Name of the book you want to search",1)</code> <br/> 
   <code>b.book_info.get_titles #to get the all titles of your search book</code> <br/> 
   <code>b.book_info.get_subtitles # to get all the subtitles of your search book</code>  
   </p>
</div>

    <h3>Many other new functionalities are comming soon.....</h3>
</body>
</html>
