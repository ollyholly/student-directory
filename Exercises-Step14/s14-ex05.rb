=begin
The filename we use to save and load data (menu items 3 and 4) is hardcoded. 
Make the script more flexible by asking for the filename if the user chooses these menu items.
=end

@students = [] # an empty array accessible to all methods
@filename = ""

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" # 9 because we'll be adding more items
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
    set_filename
    save_students
    puts "List of students saved successfully."
  when "4"
    puts "Enter the name of CSV file that you want to load"
    set_filename
    load_students(@filename)
    puts "List of students loaded."
  when "9"
    puts "Goodbye!"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    student_to_array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  # return the array of @students
end

def load_students(filename = "students.csv")
  filename = "students.csv" if !filename.exists?
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    student_to_array
  end
  file.close
end

def student_to_array
  @students << {name: name, cohort: :november}
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

def set_filename
  @filename = gets.chomp + ".csv"
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open(@filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close  
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