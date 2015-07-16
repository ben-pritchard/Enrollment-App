class EnrollmentsController < ApplicationController
  def index
    @search = Enrollment.search(params[:q])
    @enrollments = @search.result.page(params[:page])
    @search.build_condition
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollments_path, notice: 'Enrollment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:subjId, :startDate, :enrollment_state_id, :project_id, :homeId, :eligibility_state_id, :eligibility_sub_state_id, :RAId)
  end
end
