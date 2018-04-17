require './modules/date_handler.rb'
require './lib/employee.rb'
require './lib/timesheet.rb'
require './lib/project.rb'
require 'csv'

class Company
  attr_reader :employees,
              :projects,
              :timesheets,
              :success_hash
  def initialize
    @employees = []
    @projects = []
    @timesheets = []
    @success_hash = {success: true, error: nil}
  end

  def load_employees(path)
    CSV.foreach(path) do |row|
      if row.length != 5 || row[3].nil? || row[4].nil?
        success_hash[:success] = false
        success_hash[:error] = 'bad data'
        break
      end
      @employees << Employee.new(row[0], row[1], row[2], row[3], row[4])
    end
    @success_hash
  end

  def load_projects(path)
    CSV.foreach(path) do |row|
      if row.length != 4 || row[2].nil? || row[3].nil?
        success_hash[:success] = false
        success_hash[:error] = 'bad data'
        break
      end
      @projects << Project.new(row[0], row[1], row[2], row[3])
    end
    @success_hash
  end

  def load_timesheets(path)
    CSV.foreach(path) do |row|
      if row.length != 4 || row[2].nil?
        success_hash[:success] = false
        success_hash[:error] = 'bad data'
        break
      end
      @timesheets << Timesheet.new(row[0], row[1], row[2], row[3])
    end
    @success_hash
  end
end
