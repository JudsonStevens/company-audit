require './modules/date_handler.rb'
require './lib/company.rb'
require 'date'

class Audit
  def initialize
  end

  def load_company(company)
    @company = company
  end

  # def were_invalid_days_worked
  #   if check_timesheet_dates
  # end

  def check_timesheet_dates_for_weekend
    @company.timesheets.each do |timesheet|
      return 'weekend' if timesheet.date.wday == 6 || timesheet.date.wday == 7
    end
  end

  def check_timesheet_date_for_invalid_billing
    @company.timesheets.each do |timesheet|
      dh = DateHandler::DHDate.new(timesheet.date)
      project = @company.find_project_by_id(timesheet.project_id)
      if !dh.date_between(project.start_date, project.end_date)
        return 'invalid billing'
      end
    end
  end
end
