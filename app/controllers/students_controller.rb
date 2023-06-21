class StudentsController < ApplicationController

  def index
    # students = Student.all
    # render json: students

    if params[:name].present?
      students = Student.where("first_name LIKE :query OR last_name LIKE :query", query: "%#{params[:name]}%")
    else
      students = Student.all
    end

    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
