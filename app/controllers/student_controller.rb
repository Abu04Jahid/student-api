class StudentController < ApplicationController
	  before_action :set_student, only: [:show, :update, :destroy]

  # GET /student
  def index
    @student = Student.all
    json_response(@student)
  end

  # POST /student
  def create
    @student = Student.create!(student_params)
    json_response(@student, :created)
  end

  # GET /student/:id
  def show
    json_response(@student)
  end

  # PUT /student/:id
  def update
    @student.update(student_params)
    head :no_content
  end

  # DELETE /student/:id
  def destroy
    @student.destroy
    head :no_content
  end

  private

  def student_params
    # whitelist params
    params.permit(:student_name, :roll)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
