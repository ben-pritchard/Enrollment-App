class EnrollmentsController < ApplicationController
  def index
    @search = Enrollment.search(params[:q])
    @enrollments = @search.result
  end
end
