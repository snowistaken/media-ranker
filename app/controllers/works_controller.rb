class WorksController < ApplicationController
  def index
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
    @albums = Work.where(category: "album")
  end

  def show
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    end
  end

  def update
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
      return
    elsif @work.update(work_params)
      redirect_to work_path(@work.id)
      return
    else
      render :edit
      return
    end
  end

  def destroy
    work = Work.find_by(id: params[:id])

    if work.nil?
      head :not_found
      return
    else
      work.destroy
      redirect_to works_path
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to work_path(@work.id)
      return
    else
      render :new
      return
    end
  end

  def upvote
    @current_user = User.find_by(id: session[:user_id])
    @work = Work.find_by(id: params[:id])

    if @current_user.nil?
      # redirect_to work_path(@work.id)
      flash[:error] = "You must be logged in to do that!"
    else
      Vote.new(@current_user, @work)
      redirect_to work_path(@work.id)
    end
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
