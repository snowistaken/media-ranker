class HomepageController < ApplicationController

  def index

    @spotlight = Work.spotlight

    books = Work.where(category: "book")
    albums = Work.where(category: "album")
    movies = Work.where(category: "movie")

    @top_books = Work.top_ten(books)
    @top_albums = Work.top_ten(albums)
    @top_movies = Work.top_ten(movies)

  end

end
