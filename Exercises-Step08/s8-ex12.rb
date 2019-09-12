# What happens if the user doesn't enter any students? It will try to print an empty list. 
# How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?

def input_students
  students = []
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  
  while true
    puts "Please enter the name of the student"
    name = gets.strip
    puts "Please enter the cohort month"
    input = gets.strip.capitalize
    cohort = input.length > 0 ? input : "November"
    while !months.include?(cohort)
      puts "Enter a valid month"
      cohort = gets.strip.capitalize
    end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students" if students.count > 1
    puts "Now we have #{students.count} student" if students.count == 0
    puts "Would you like to enter another student? (y/n)"
    choice = gets.strip
    break if choice == "n"
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if students.empty?
    cohorts = students.map { |student| student[:cohort] }.uniq
    cohorts.each do |cohort|
      students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:cohort] == cohort }
    end
  else
    puts "There are no students"
    exit
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