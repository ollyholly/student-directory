# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]
# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   # create an empty array
#   students = []
#   # get the first name
#   name = gets.chomp
#   # while the name is not empty repeat this code
#   while !name.empty? do
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     name = gets.chomp
#   end
#   # return the array of students
#   students
# end
def input_students
  students = []
  while true
    puts "Please enter the names of the student"
    # get the first name
    name = gets.chomp
    puts "Please enter the cohort month"
    # get the first name
    cohort = gets.chomp.to_sym
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students" if students.count > 1
    puts "Now we have #{students.count} student" if students.count == 0
    puts "Would you like to enter another student? (y/n)"
    input = gets.chomp
    break if input == "n"
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  cohorts = students.map { |student| student[:cohort] }.uniq
  cohorts.each do |cohort|
    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == cohort }
  end
end
# def print(students)
#   students.each_with_index do |student, index|
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     # if student[:name][0] == "B" && student[:name].length < 12
#   end
# end
# def print(students)
#   i = 0
#   while i <= students.length
#     puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)" if students[i][:name][0] == "B" && students[i][:name].length < 12
#   end
# end
def print_footer(names)
  puts "Overall, we have #{names.count} great students" if names.count > 1
  puts "Overall, we have #{names.count} great student" if names.count == 1
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)