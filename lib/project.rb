require './modules/date_handler.rb'

class Project
  attr_reader :project_id,
              :name,
              :start_date,
              :end_date
  def initialize(project_id, name, start_date, end_date)
    @project_id = project_id.to_i
    @name = name
    @start_date = DateHandler.string_to_date(start_date)
    @end_date = DateHandler.string_to_date(end_date)
  end
end
