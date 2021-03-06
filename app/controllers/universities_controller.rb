class UniversitiesController < ApplicationController
  include VotesSubcontroller
  include DownloadsSubcontroller

  before_action :set_university, only: [:show, :edit, :update, :destroy, :address, :units, :lectors, :raiting]

  respond_to :json, :html

  def index
    @universities = University.all.paginate(page: params[:page], per_page: Settings.pagination)
    respond_with(@universities)
  end

  def welcome
    @data = University.pluck(:vote).map{ |x| x = x.to_f / 101 }
  end

  def show
    respond_with(@university)
  end

  def address
    respond_with(@university)
  end

  def units
    @faculties = @university.faculties.paginate(page: params[:page], per_page: Settings.pagination)
  end

  def raiting
    @raiting = {}
    @university.faculties.each{ |f| @raiting[f.name] = f.vote }
  end

  def show
    respond_with(@university)
  end


  def new
    @university = University.new
    respond_with(@university)
  end

  def edit
  end

  def create
    @university = University.new(university_params)
    @university.save
    respond_with(@university)
  end

  def update
    @university.update(university_params)
    respond_with(@university)
  end

  def destroy
    @university.destroy
    respond_with(@university)
  end

  private
    def set_university
      @university = University.find(params[:id])
    end

    def university_params
      params.require(:university).permit(:name, :address, :coordinates, :vote, :description)
    end
end
