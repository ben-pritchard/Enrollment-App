class EnrollmentsController < ApplicationController
  def index
    binding.pry
    @enrollments = Enrollment.all
    render :index
  end
end
