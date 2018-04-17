require './modules/date_handler.rb'
require './lib/employee.rb'
require './lib/timesheet.rb'
require './lib/project.rb'

class Company
  attr_reader :employees,
              :projects,
              :timesheets
  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees
    success_hash = {success: true, error: nil}
    CSV.foreach('./data/employees.csv') do |row|
      data = row.split(',')
      if data.length != 5
        success_hash[:success] = false
        success_hash[:error] = 'bad data'
        break
      end
      @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
    end
  end

  def load_projects
end
