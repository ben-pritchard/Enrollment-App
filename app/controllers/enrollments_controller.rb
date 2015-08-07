class EnrollmentsController < ApplicationController
  def index
    @search = Enrollment.search(params[:q])
    @enrollments = @search.result.page(params[:page])
    @search.build_condition
    respond_to do |format|
      format.html{}
      format.csv {
        @enrollments = @search.result
        headers['Content-Disposition'] = "attachment; filename=enrollment-list.csv"
        headers['Content-Type'] = 'text/csv; charset=iso-8859-1'
      }
    end
  end

  def active
    @search = Enrollment.search(params[:q])
    @enrollments = @search.result.active.page(params[:page])
    @search.build_condition
  end

  def screening
    @search = Enrollment.search(params[:q])
    @enrollments = @search.result.screening.page(params[:page])
    @search.build_condition
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollments_path, notice: 'Enrollment successfully created!' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.update(enrollment_params)
      flash[:notice] = "Enrollment successfully updated!"
      redirect_to enrollment_path(@enrollment)
    else
      render :edit
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    flash[:notice] = "Enrollment successfully deleted!"
    redirect_to enrollments_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:subjId, :startDate, :enrollment_state_id, :project_id, :homeId, :eligibility_state_id, :eligibility_sub_state_id, :RAId)
  end
end
