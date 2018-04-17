require './modules/date_handler.rb'
require './lib/company.rb'

class Audit
  def initialize
  end

  def load_company(company)
    @company = company
  end

  # def were_invalid_days_worked
  #   if check_timesheet_dates
  # end

  def check_timesheet_dates
    @company.timesheets.each do |timesheet|
      return 'weekend' if timesheet.date.wday == 6 || timesheet.date.wday == 7
    end
  end


end
