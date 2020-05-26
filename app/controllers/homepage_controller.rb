class HomepageController < ApplicationController

  def index

    @spotlight = Work.spotlight

    @top_books = Work.top_ten(Work.where(category: "book"))
    @top_albums = Work.top_ten(Work.where(category: "album"))
    @top_movies = Work.top_ten(Work.where(category: "movie"))

  end

end
