require './modules/date_handler.rb'
require './lib/company.rb'
require 'date'

class Audit
  def initialize
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_days_worked
    return return_message_for_weekend if return_message_for_weekend != []
    return return_message_for_invalid_date if return_message_for_invalid_date != []
    "Invalid Days Worked: \nNone"
  end

  def return_message_for_weekend
    check_timesheet_dates_for_weekend.map do |response|
      if response.class == Hash
        employee = @company.find_employee_by_id(response[:employee_id])
        project = @company.find_project_by_id(response[:project_id])
        "Invalid Days Worked: \n#{employee.name} worked on #{project.name} on #{response[:date]}, it was a(n) #{response[:reason]}."
      end
    end.compact[0]
  end

  def check_timesheet_dates_for_weekend
    @company.timesheets.map do |timesheet|
      if timesheet.date.wday == 6 || timesheet.date.wday == 7
        {project_id: timesheet.project_id, employee_id: timesheet.employee_id, date: timesheet.date, reason: 'weekend'}
      else
        nil
      end
    end
  end

  def check_timesheet_date_for_invalid_billing
    @company.timesheets.map do |timesheet|
      dh = DateHandler::DHDate.new(timesheet.date)
      project = @company.find_project_by_id(timesheet.project_id)
      if !dh.date_between(project.start_date, project.end_date)
        {project_id: timesheet.project_id, employee_id: timesheet.employee_id, reason: 'invalid billing date'}
      else
        nil
      end
    end
  end
end
