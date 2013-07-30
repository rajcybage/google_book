require_relative '../lib/google_book/base.rb'

context "When want to access google api" do
  let (:api_key) {'AIzaSyD82ugogyUN7bAZ4k2UaLlVCep5NxZVYNM'}
 describe "initialize" do
  @google_book = GoogleBook::Book.new(:api_key => api_key)
  @google_book.should be_a_kind_of(Object)
  @google_book.should not_be_nil
 end
end