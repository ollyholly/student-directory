=begin
We are de-facto using CSV format to store data.
However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files. 
Refactor the code to use this library.
=end

require "csv"

@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "\n--------------------------"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" # 9 because we'll be adding more items
  puts "--------------------------\n"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "Now you can input the student info"
    input_students
  when "2"
    puts "Showing the list of students"
    show_students
  when "3"
    puts "Enter the name of CSV file where you want to save the list"
    save_file = STDIN.gets.chomp
    save_file.empty? ? save_students : save_students(save_file)
    puts "List of students saved successfully."
  when "4"
    puts "Enter the name of CSV file that you want to load"
    load_file = STDIN.gets.chomp
    load_file.empty? ? load_students : load_students(load_file)
    puts "List of students loaded."
  when "9"
    puts "Goodbye!"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  puts "Please enter the cohort"
  if !name.empty? 
    cohort_input = STDIN.gets.chomp
    cohort_input.empty? ? (cohort = :november) : (cohort = cohort_input.to_sym)
  end
  
  while !name.empty? do
    student_to_array(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
    puts "Please enter the cohort"
    if !name.empty? 
      cohort_input = STDIN.gets.chomp
      cohort_input.empty? ? (cohort = :november) : (cohort = cohort_input.to_sym)
    end
  end
end

def student_to_array(name, cohort)
  @students << {name: name, cohort: cohort }
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
  # open the file for writing
  CSV.open(filename, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      file << [student[:name], student[:cohort]]
    end
  end 
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    name, cohort = line
    student_to_array(name, cohort.to_sym)
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    load_students("students.csv")
    puts "Loaded #{@students.count} from students.csv"
  end
  
end

try_load_students
interactive_menu