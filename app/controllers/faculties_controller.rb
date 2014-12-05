class FacultiesController < ApplicationController
  include VotesSubcontroller
  include DownloadsSubcontroller
  
  before_action :set_university
  before_action :set_faculty, only: [:show, :edit, :update, :destroy, :units, :raiting]

  respond_to :json, :html

  def index
    @faculties = @university.faculties.paginate(page: params[:page], per_page: Settings.pagination)
    respond_with(@faculties)
  end

  def show
    respond_with(@university, @faculty)
  end

  def units
    @departments = @faculty.departments.paginate(page: params[:page], per_page: Settings.pagination)
  end

  def raiting
    @raiting = {}
    @faculty.departments.each{ |f| @raiting[f.name] = f.vote }
  end

  def new
    @faculty = @university.faculties.new
    respond_with(@university, @faculty)
  end

  def edit
  end

  def create
    @faculty = @university.faculties.new(faculty_params)
    @faculty.save
    respond_with(@university, @faculty)
  end

  def update
    @faculty.update(faculty_params)
    respond_with(@university, @faculty)
  end

  def destroy
    @faculty.destroy
    respond_with(@university, @faculty)
  end

  private
    def set_faculty
      @faculty = @university.faculties.find params[:id]
    end

    def set_university
      @university = University.find params[:university_id]
    end

    def faculty_params
      params.require(:faculty).permit(:name, :vote, :description)
    end
end
