class SessionsController < ApplicationController
  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
	student = Student.authenticate params[:email], params[:password]
	  if student
	    session[:student_id] = student.id
	    redirect_to root_path, :notice => "Welcome back to College Park Book Trade"
	  else
	    redirect_to :login, :alert => "Invalid email or password"
	  end
  end

  def destroy
    session[:student_id] = nil
    redirect_to root_path :notice => "You have been logged out"
  end
end
