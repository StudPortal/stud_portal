class GroupsController < ApplicationController
  include VotesSubcontroller
  include DownloadsSubcontroller
  
  before_action :set_department
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  def index
    @groups = @department.groups.paginate(page: params[:page], per_page: Settings.pagination)
    respond_with(@groups)
  end

  def show
    respond_with(@university, @faculty, @department, @group)
  end

  def new
    @group = @department.groups.new
    respond_with(@university, @faculty, @department, @group)
  end

  def edit
  end

  def create
    @group = @department.groups.new(group_params)
    @group.save
    respond_with(@university, @faculty, @department, @group)
  end

  def update
    @group.update(group_params)
    respond_with(@university, @faculty, @department, @group)
  end

  def destroy
    @group.destroy
    respond_with(@university, @faculty, @department, @group)
  end

  private
    def set_group
      @group = @department.groups.find(params[:id])
    end

    def set_department
      @university = University.find params[:university_id]
      @faculty    = @university.faculties.find params[:faculty_id]
      @department = @faculty.departments.find params[:department_id]
    end

    def group_params
      params.require(:group).permit(:name, :vote)
    end
end
