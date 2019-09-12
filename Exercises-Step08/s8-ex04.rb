# Rewrite the each() method that prints all students using while or until control flow methods

# Modify your program to only print the students whose name is shorter than 12 characters.

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
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i <= students.length
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)" if students[i][:name][0] == "B" && students[i][:name].length < 12
    i += 1
  end
end

students = input_students
print_header
print(students)
print_footer(students)