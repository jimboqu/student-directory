require 'CSV'
@students = []
def pluralize(number)
  if number == 1
    return "student"
  else
    return "students"
  end
end

def gets_return(string)
  return string.rstrip
end

def order_students
  @students.sort_by! { |hsh| hsh[:cohort] }
end

def add_cohort
  puts "Add cohort month (January, April, July, October):"
  while true
    cohort = input_cohort
    if cohort == "January" || cohort == "April" || cohort == "July" || cohort == "October"
      cohort = cohort
      break
    elsif
      cohort == ""
      cohort = "TBC"
      break
    else
      puts "Not recognised. Can you enter again"
      cohort = "wrong"
    end
  end
  return cohort.to_sym
end

def input_interests
  puts "Enter interests:"
  hobbies = STDIN.gets
  hobbies = gets_return(hobbies)
end

def input_cohort
  cohort = STDIN.gets.capitalize
  cohort = gets_return(cohort)
end

def input_address
  puts "Enter place of birth:"
  city = STDIN.gets
  city = gets_return(city)
end

def input_name
  puts "Enter the name of student"
  name = STDIN.gets
  name = gets_return(name)
end

def input_students_messages
  puts "1 student added. Now we have #{@students.count} #{pluralize(@students.count)}."
  puts "Add another student or hit return to menu."
end

def input_students
  name = input_name
    while !name.empty? do
      load_or_input_students(name, add_cohort, input_interests, input_address)
      input_students_messages
      name = STDIN.gets.chomp
    end
end

def load_or_input_students(name, cohort, hobbies, city)
  @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, city: city}
end

def file_operation(what_function)
  puts "Enter your filename:"
  input_file = gets.chomp
  if what_function == "save"
    save_students(input_file)
  elsif
    what_function == "load"
    load_students(input_file)
  end
end

def load_students(filename="students.csv")
  @students = []
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort, hobbies, city = line.chomp.split(',')
      load_or_input_students(name, cohort, hobbies, city)
    end
  end
  puts "#{filename } loaded"
end

def save_students(save_file)
  File.open(save_file, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobbies], student[:city]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Students saved to file"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def student_filter
  while true
    puts "Enter a letter:"
    filter = STDIN.gets.chomp
    if filter.length == 1
      break
      else puts "Enter just one letter please"
    end
  end
  filter
end

def print_header
  puts "The Academy of Football"
  puts "----------------"
end

def print
  count = @students.count
  order_students
  if count < 1 || nil
    puts "There are no students entered"
    interactive_menu
  end
  filter = student_filter
  i = 0
  while i < count
    if @students[i][:name].start_with?(filter) || @students[i][:name].start_with?(filter.capitalize) && @students[i][:name].length <= 12
      puts "#{i+1}: Name: #{@students[i][:name].center(12)}\n   Cohort:" + @students[i][:cohort].to_s.center(12) + "\n   Hobbies: #{@students[i][:hobbies].center(8)} \n   Country: #{@students[i][:city].center(8)}"
      puts "--------------"
    end
    i+=1
  end
end

def print_footer
  puts "Overall we have #{@students.count} great #{pluralize(@students.count)}."
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to students.csv"
  puts "4. Load students from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    file_operation("save")
  when "4"
    file_operation("load")
  when "9"
    exit
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

try_load_students
interactive_menu
