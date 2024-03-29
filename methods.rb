# frozen_string_literal: true

require 'TTY-prompt'
require 'colorize'
require 'tty-font'
require 'pastel'

def home_page
  font = TTY::Font.new(:doom)
  pastel = Pastel.new
  puts pastel.yellow(font.write('EASY  DOCTOR '))
  puts pastel.yellow(font.write('APPOINTMENT'))
end

# create appointment
def create_details(doctor_name, date, time)
  prompt = TTY::Prompt.new
  full_name = prompt.ask('Enter your full name'.colorize(:cyan), required: true)
  dob = prompt.ask('Enter your date of birth (follow dd/mm/yyyy format)'.colorize(:cyan), required: true)
  mobile_num = prompt.ask('Enter your mobile number'.colorize(:cyan), required: true)
  appointment = Appointment.new(doctor_name, date, time, full_name, dob, mobile_num)
end

# check availability
def check_availability(doctor_name, date, time, appointments)
  appointments.each do |app|
    if app.doctor_name == doctor_name && app.date == date && app.time == time
      return false
    end
  end
  true
end

# view details
def view_details(date, appointments)
  match_found_flag = false
  appointments.each do |app|
    next unless app.date == date

    match_found_flag = true
    puts "\nAvailable Appointments:".colorize(:magenta)
    puts "\nDoctor: #{app.doctor_name} | Patient_Name: #{app.full_name} | Date: #{app.date} | Time: #{app.time}".colorize(:green)
  end
  unless match_found_flag
    puts "\nSorry! No Appointments Available To View".colorize(:light_red)
  end
end

# Delete appointment
def delete_appointment(doctor_name, date, time, appointments)
  appointments.each do |app|
    if app.doctor_name == doctor_name && app.date == date && app.time == time
      appointments.delete(app)
      return false
    end
  end
  true
end

# when exit..write in to file

def save_and_exit(appointments)
  File.open('details.txt', 'w') do |f|
    appointments.each do |element|
      f.puts("#{element.doctor_name},#{element.date},#{element.time},#{element.full_name},#{element.dob},#{element.mobile_num}")
    end
  end
rescue StandardError => e
  puts "failed to save #{e}"
end

# read from file
def load_records(appointments)
  file = 'details.txt'
  File.readlines(file).each do |line|
    arr = line.chomp.split(',')
    a1 = Appointment.new(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
    appointments << a1
  end
rescue StandardError => e
  puts "failed to load #{e}"
  puts appointments.to_s
  puts appointments.length
end
