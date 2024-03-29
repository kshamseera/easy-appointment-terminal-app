# frozen_string_literal: true

class Appointment
  attr_accessor :doctor_name, :date, :time, :full_name, :mobile_num, :dob
  def initialize(doctor_name, date, time, full_name, dob, mobile_num)
    @doctor_name = doctor_name
    @date = date
    @time = time
    @full_name = full_name
    @dob = dob
    @mobile_num = mobile_num
  end
  end
