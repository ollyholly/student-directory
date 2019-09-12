# In the input_students method the cohort value is hard-coded. 
# How can you ask for both the name and the cohort? 
# What if one of the values is empty? Can you supply a default value? 
# The input will be given to you as a string? How will you convert it to a symbol? What if the user makes a typo?

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