class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :destroy]

  def index
    @students = current_teacher.students
  end

  def new
    @student = Student.new
  end

  def create
    @student = current_teacher.students.find_or_create_by(name: params[:student][:name])
    if @student
      @student_record = @student.student_records.find_or_create_by(subject: params[:subject])
      @student_record.update(marks: params[:marks])
      redirect_to teacher_home_path, notice: "Student Record added successfully"
    else
      render :new
    end
  end

  def edit
    @student = Student.find_by(id: params[:id])
    @student_record = StudentRecord.find_by(id: params[:student_record_id])
  end

  def update
    @student_record = StudentRecord.find_by(id: params[:student_record_id])
    if @student_record.update(subject: params[:subject], marks: params[:marks])
      redirect_to teacher_home_path, notice: "Student updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @student_record = StudentRecord.find_by(id: params[:student_record_id])
    @student_record.destroy
    redirect_to teacher_home_path, notice: "Student deleted successfully"
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end
end
