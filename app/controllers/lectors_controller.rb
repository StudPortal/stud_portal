class LectorsController < ApplicationController
  extend VotesSubcontroller
  
  before_action :set_department
  before_action :set_lector, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lectors = @department.lectors.paginate(:page => params[:page], :per_page => 15)
    respond_with(@lectors)
  end

  def show
    respond_with(@university, @faculty, @department, @lector)
  end

  def new
    @lector = @department.lectors.new
    respond_with(@university, @faculty, @department, @lector)
  end

  def edit
  end

  def create
    @lector = @department.lectors.new(lector_params)
    @lector.save
    respond_with(@university, @faculty, @department, @lector)
  end

  def update
    @lector.update(lector_params)
    respond_with(@university, @faculty, @department, @lector)
  end

  def destroy
    @lector.destroy
    respond_with(@university, @faculty, @department, @lector)
  end

  private
    def set_lector
      @lector = @department.lectors.find(params[:id])
    end

    def set_department
      @university = University.find params[:university_id]
      @faculty    = @university.faculties.find params[:faculty_id]
      @department = @faculty.departments.find params[:department_id]
    end

    def lector_params
      params.require(:lector).permit(:name, :position, :vote)
    end
end
