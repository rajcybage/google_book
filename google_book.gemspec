require './lib/google_book/version.rb'
Gem::Specification.new do |s|
  s.name        = 'google_book'
  s.version     = GoogleBook::Version
  s.date        = '2013-07-07'
  s.summary     = "Google Book API integration"
  s.description = "Integrate the google book api into your app"
  s.authors     = ["Rajarshi Das"]
  s.email       = 'rdasarminus@gmail.com'
  s.files       = ["lib/google_book.rb", "lib/google_book/base.rb", "lib/google_book/book_info.rb", "lib/google_book/book_item.rb"]
  s.homepage    = 'https://github.com/rajcybage/google_book'
end