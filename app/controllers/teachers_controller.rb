class TeachersController < ApplicationController
    def new
      @teacher = Teacher.new
    end
  
    def create
      @teacher = Teacher.new(teacher_params)
      if @teacher.save
        session[:teacher_id] = @teacher.id
        redirect_to teacher_home_path
      else
        respond_to do |format|
          format.turbo_stream do
            error_message = @teacher&.errors&.full_messages&.first || "account not created"
            render turbo_stream: turbo_stream.replace('teacher-create-error', partial:"teachers/teacher_create_error", locals: {error_message: error_message })
            
          end
        end
      end
    end

    def forget_password
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('new-session-page', partial:"teachers/forget_password_page")
        end
      end
    end

    def verify_email
      @teacher = Teacher.find_by(email: params[:email])
      if @teacher
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('new-session-page', partial:"teachers/reset_password_page")
          end
        end
      else
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('email-exist-error', partial:"teachers/email_exist_error")
          end
        end
      end
    end

    def reset_password
      @teacher = Teacher.find_by(id: params[:teacher_id])
      if @teacher.update(password: params[:teacher][:password], password_confirmation: params[:teacher][:password_confirmation])
        session[:teacher_id] = @teacher.id
        redirect_to teacher_home_path
      else
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace('password-match-error', partial:"teachers/password_match_error")
          end
        end
      end
    end
  
    private
  
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
    end
  end
  