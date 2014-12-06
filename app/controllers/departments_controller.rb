class DepartmentsController < ApplicationController
  include VotesSubcontroller
  include DownloadsSubcontroller

  before_action :set_faculty
  before_action :set_department, only: [:show, :edit, :update, :destroy, :groups_unit, :lectors_unit, :groups_raiting, :lectors_raiting]

  respond_to :json, :html

  def index
    @departments = @faculty.departments.all.paginate(page: params[:page], per_page: Settings.pagination)
    respond_with(@departments)
  end

  def show
    respond_with(@university, @faculty, @department)
  end

  def groups_unit
    @groups = @department.groups.paginate(page: params[:page], per_page: Settings.pagination)
  end

  def lectors_unit
    @lectors = @department.lectors.paginate(page: params[:page], per_page: Settings.pagination)
  end

  def groups_raiting
    @groups_raiting = {}
    @department.groups.each{ |g| @groups_raiting[g.name] = g.vote }
  end

  def lectors_raiting
    @lectors_raiting = {}
    @department.lectors.each{ |l| @lectors_raiting[l.name] = l.vote }
  end

  def new
    @department = @faculty.departments.new
    respond_with(@university, @faculty, @department)
  end

  def edit
  end

  def create
    @department = @faculty.departments.new(department_params)
    @department.save
    respond_with(@university, @faculty, @department)
  end

  def update
    @department.update(department_params)
    respond_with(@university, @faculty, @department)
  end

  def destroy
    @department.destroy
    respond_with(@university, @faculty, @department)
  end

  private

    def set_department
      @department = @faculty.departments.find(params[:id])
    end

    def set_faculty
      @university = University.find params[:university_id]
      @faculty    = @university.faculties.find params[:faculty_id]
    end

    def department_params
      params.require(:department).permit(:name, :vote, :description)
    end
    
end
