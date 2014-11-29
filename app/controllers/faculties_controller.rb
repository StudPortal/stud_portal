class FacultiesController < ApplicationController
  before_action :set_university
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  def index
    @faculties = @university.faculties
    respond_with(@faculties)
  end

  def show
    respond_with(@university, @faculty)
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
      params.require(:faculty).permit(:name)
    end
end
