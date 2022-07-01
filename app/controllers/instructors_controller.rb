class InstructorsController < ApplicationController
  def index
    render json: Instructor.all
  end

  def show
    render json: Instructor.find(params[:id])
  end

  def create
    new_instructor = Instructor.create!(name: params[:name])
    render json: new_instructor, status: :created
  end

  def update
    instructor = Instructor.find(params[:id])
    instructor.update!(name: params[:name])
    render json: instructor
  end

  def destroy
    Instructor.find(params[:id]).destroy
    head :no_content
  end
end
