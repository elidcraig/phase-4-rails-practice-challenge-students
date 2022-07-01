class StudentsController < ApplicationController
  def index
    render json: Student.all
  end

  def show
    render json: Student.find(params[:id])
  end

  def create
    new_student = Student.create!(student_params)
    render json: new_student, status: :created
  end

  def update
    student = Student.find(params[:id])
    Student.update!(student_params)
    render json: student
  end

  def destroy
    Student.find(params[:id]).destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name, :major, :age, :instructor_id)
  end
end
