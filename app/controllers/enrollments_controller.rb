class EnrollmentsController < ApplicationController
  def index
    @search = Enrollment.search(params[:q])
    @enrollments = @search.result
    @search.build_condition
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.build(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:subjId, :enrollment_state_id, :project_id)
  end
end
