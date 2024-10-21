class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by(email: params[:email])
    if teacher&.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      redirect_to teacher_home_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
