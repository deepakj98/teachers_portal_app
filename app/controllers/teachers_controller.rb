class TeachersController < ApplicationController
    def new
      @teacher = Teacher.new
    end
  
    def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        session[:teacher_id] = @teacher.id
        redirect_to teacher_home_path, notice: "Account created successfully, please log in."
      else
        render :new
      end
    end
  
    private
  
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
    end
  end
  