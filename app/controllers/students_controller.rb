class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@students = current_user.students
  end	

  def new
  	@student = current_user.students.new
  end

  def edit
  	@student = Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
 
    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])
    @mark = @student.marks
    @marks =  params[:student][:marks]
    @sum_marks = @mark.to_f + @marks.to_f
    if @student.update_attribute(:marks, @sum_marks)
      @student.save
      redirect_to students_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
 
    redirect_to students_path
  end

  private
    def student_params
      params.require(:student).permit(:name, :marks, :subject, :user_id)
    end

end
