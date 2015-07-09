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
    
  end
end
