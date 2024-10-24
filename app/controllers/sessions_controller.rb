class SessionsController < ApplicationController
  def new
  end

  def create
    teacher = Teacher.find_by(email: params[:email])
    if teacher&.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      redirect_to teacher_home_path, notice: "Logged in successfully"
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('login-error', partial: "sessions/login_error")
        end
      end
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
