# frozen_string_literal: true

require_relative 'appointment-class'
# require_relative 'main'
require_relative 'methods'

def not_delete_file_scenario
  fake_list = []
  actual_doctor_name = 'peter'
  actual_date = '12/4/2019'
  actual_time = '2'
  full_name = 'shamseera'
  dob = '18/10/1991'
  mobile_num = '470345722'
  expected_doctor_name = 'lucy'
  expected_date = '13/11/2019'
  expected_time = '3'

  appointment = Appointment.new(actual_doctor_name, actual_date, actual_time, full_name, dob, mobile_num)
  fake_list << appointment
  if delete_appointment(expected_doctor_name, expected_date, expected_time, fake_list) == true
    puts 'pass'
  else
    puts 'fail'
   end
end

def delete_file_scenario
  fake_list = []
  actual_doctor_name = 'peter'
  actual_date = '12/4/2019'
  actual_time = '2'
  full_name = 'shamseera'
  dob = '18/10/1991'
  mobile_num = '470345722'
  expected_doctor_name = 'peter'
  expected_date = '12/4/2019'
  expected_time = '2'

  appointment = Appointment.new(actual_doctor_name, actual_date, actual_time, full_name, dob, mobile_num)
  fake_list << appointment
  if delete_appointment(expected_doctor_name, expected_date, expected_time, fake_list) == false
    puts 'pass'
  else
    puts 'fail'
      end
  end

  not_delete_file_scenario
  delete_file_scenario