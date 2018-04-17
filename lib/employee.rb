require './modules/date_handler.rb'

class Employee

  attr_reader :employee_id,
              :name,
              :role,
              :start_date,
              :end_date
  def initialize(employee_id, name, role, start_date, end_date)
    @employee_id = employee_id.to_i
    @name = name
    @role = role
    @start_date = DateHandler.string_to_date(start_date)
    @end_date = DateHandler.string_to_date(end_date)
  end

end





# require './lib/employee'
#
# employee_id = '5'
# name = 'Sally Jackson'
# role = 'Engineer'
# start_date = '2015-01-01'
# end_date = '2018-01-01'
# employee = Employee.new(employee_id, name, role, start_date, end_date)
# => #<Employee...>
#
# # make sure to convert all ID values to integers
# employee.id.class
# => Integer
# employee.name
# => "Sally Jackson"
# employee.role
# => "Engineer"
# employee.start_date
# => #<Date: 2015-01-01 ((2457024j,0s,0n),+0s,2299161j)>
# employee.end_date
# => #<Date: 2018-01-01 ((2458120j,0s,0n),+0s,2299161j)>
