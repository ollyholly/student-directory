# Change the way the users are displayed: print them grouped by cohorts. 
# To do this, you'll need to get a list of all existing cohorts (the map() method may be useful but it's not the only option), 
# iterate over it and only print the students from that cohort.

# Right now if we have only one student, the user will see a message "Now we have 1 students", whereas it should be "Now we have 1 student". 
# How can you fix it so that it used singular form when appropriate and plural form otherwise?


def input_students
  students = []
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  
  while true
    puts "Please enter the name of the student"
    name = gets.chomp
    puts "Please enter the cohort month"
    input = gets.chomp.capitalize
    cohort = input.length > 0 ? input : "November"
    while !months.include?(cohort)
      puts "Enter a valid month"
      cohort = gets.chomp.capitalize
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students" if students.count > 1
    puts "Now we have #{students.count} student" if students.count == 0
    puts "Would you like to enter another student? (y/n)"
    choice = gets.chomp
    break if choice == "n"
  end

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

def print_footer(names)
  puts "Overall, we have #{names.count} great students" if names.count > 1
  puts "Overall, we have #{names.count} great student" if names.count == 1
end
students = input_students
print_header
print(students)
print_footer(students)