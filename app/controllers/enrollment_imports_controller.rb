class EnrollmentImportsController < ApplicationController
  def new
    @enrollment_import = EnrollmentImport.new
    @imported_enrollments = []
  end

  def create
    @enrollment_import = EnrollmentImport.new(params[:enrollment_import])
    @enrollment_import.save
    @imported_enrollments = @enrollment_import.imported_enrollments
    render :new
  end

  private
  def enrollment_import_params
    params.require(:enrollment_import).permit(:file)
  end
end
