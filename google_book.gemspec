require './lib/google_book/version.rb'
Gem::Specification.new do |s|
  s.name        = 'google_book'
  s.version     = GoogleBook::Version
  s.date        = '2013-08-08'
  s.summary     = "Google Book API integration for fetching the information for google books and magazines and book shelves also filter them. You can eaisly get most of the elements for a particular book and magazine or the books of a book shelf from the google book search. like :-(title,sub title,preview link,authors,publisher,publish date,buylink,downloadlink,version,ISBN information,ratings,...many more..Also you can get the google checkout link for that book/magazine"
  s.authors     = ["Rajarshi Das"]
  s.license     = "Copyright (c) Rajarshi Das. All rights reserved"
  s.email       = 'rdasarminus@gmail.com'
  s.files       = ["README.md","Gemfile","Rakefile", "spec/base_spec.rb","spec/book_item_spec.rb", "spec/book_shelves_spec.rb", "lib/google_book.rb", "lib/google_book/base.rb", "lib/google_book/book_info.rb", "lib/google_book/book_item.rb", "lib/google_book/book_shelves.rb", "lib/google_book/uri.rb", "lib/google_book/book_shelf_item.rb"]
  s.homepage    = 'https://github.com/rajcybage/google_book'
end
