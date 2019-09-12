# Our code only works with the student name and cohort. Add more information: hobby, country of birth, height

def input_students

  students = []
  puts "Please enter a name"
  puts "To finish, just hit return twice"
  name = gets.chomp
 
  while !name.empty? do
    puts "Please enter their cohort month"
    cohort = gets.chomp 
    puts "Please enter their height in m"
    height = gets.chomp 
    puts "Please enter their country of origin"
    country = gets.chomp
    puts "Please enter their hobby"
    hobbies = gets.chomp
    students << {name: name, cohort: cohort, height: height, 
    country: country, hobby: hobby }
    puts "Now we have #{students.count} students" if students.count > 1
    puts "Now we have #{students.count} student" if students.count == 0
    puts "Please enter the name of the student"
    puts "To finish, just hit return twice"
    input = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name].capitalize} belongs to (#{student[:cohort].capitalize} cohort)"
    puts "They are #{student[:height]}m tall"
    puts "Their hobby is #{student[:hobby]}"
    puts "They were born in #{student[:country].capitalize}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)