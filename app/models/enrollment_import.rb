class EnrollmentImport

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file, :original_enrollments, :updated_enrollments, :new_enrollments

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
    @original_enrollments = []
    @updated_enrollments = []
    @new_enrollments = []
  end

  def persisted?
    false
  end

  def save
    if imported_enrollments == []
      return false
    elsif imported_enrollments.map(&:valid?).all?
      imported_enrollments.each(&:save!)
      true
    else
      imported_enrollments.each_with_index do |enrollment, index|
        enrollment.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_enrollments
    @imported_enrollments ||= load_imported_enrollments
  end

  def load_imported_enrollments
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    header.each_with_index do |h, index|
      header[index] = header[index].snake_case
    end
    enrollments = []
    repeat_ids = []
    (2..spreadsheet.last_row).collect do |i|
      hash = Hash[[header, spreadsheet.row(i)].transpose]
      enrollment = Enrollment.new
      enrollment.assign_attributes(subjId: hash["subject_id"], homeId: hash["home_id"], startDate: hash["start_date"], RAId: hash["ra_id"])

      enrollment_state = EnrollmentState.find_by(Name: hash["status"])
      enrollment.assign_attributes(enrollment_state_id: enrollment_state.id)
binding.pry
      eligibility_state = EligibilityState.find_by(Title: hash["eligibility"])
      enrollment.assign_attributes(eligibility_state_id: eligibility_state.id)

      eligibility_sub_state = EligibilitySubState.find_by(Title: hash["secondary"])
      enrollment.assign_attributes(eligibility_sub_state_id: eligibility_sub_state.id)

      project = Project.find_by(name: hash["project_name"])
      enrollment.assign_attributes(project_id: project.id)

      enrollments << enrollment

    end
    enrollments
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: Encoding::ISO_8859_1})
    when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
