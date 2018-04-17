require './modules/date_handler.rb'

class Timesheet
  attr_reader :employee_id,
              :project_id,
              :date,
              :minutes
  def initialize(employee_id, project_id, date, minutes)
    @employee_id = employee_id.to_i
    @project_id = project_id.to_i
    @date = DateHandler.string_to_date(date)
    @minutes = minutes.to_i
  end
end

# require './lib/timesheet'
#
# employee_id = '5'
# project_id = '7'
# date = '2015-01-01'
# minutes = '120'
# timesheet = Timesheet.new(employee_id, project_id, date, minutes)
# => #<Timesheet...>
#
# # make sure to convert all ID values to integers
# timesheet.employee_id.class
# => Integer
# timesheet.project_id.class
# => Integer
# timesheet.date
# => #<Date: 2015-01-01 ((2457024j,0s,0n),+0s,2299161j)>
# timesheet.minutes.class
# => Integer
