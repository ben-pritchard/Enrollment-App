class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end
end
