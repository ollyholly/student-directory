# Use center() to to make the output beautifully aligned.

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(120)
  puts "-------------".center(120)
end

def print(students)
  students.each { |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(120) } 
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(120)
end

students = input_students
print_header
print(students) 
print_footer(students)