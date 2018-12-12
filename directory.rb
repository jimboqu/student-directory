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
    cohort = STDIN.gets.capitalize
    cohort = gets_return(cohort)
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

def input_students
  puts "Enter the name of student"
  puts "To finish, hit return twice"
  #students = []
  name = STDIN.gets
  name = gets_return(name)
    while !name.empty? do
      cohort = add_cohort
      puts "Enter hobbies:"
      hobbies = STDIN.gets
      hobbies = gets_return(hobbies)
      puts "Enter place of birth:"
      city = STDIN.gets
      city = gets_return(city)
      @students << {name: name, cohort: cohort, hobbies: hobbies, city: city}
      puts "Now we have #{@students.count} #{pluralize(@students.count)}."
      name = STDIN.gets.chomp
    end
  order_students
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobbies, city = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, city: city}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:city]]
    #if there's a problem with saving its in hobbies and city
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def student_filter
  while true
    puts "Enter a letter:"
    filter = STDIN.gets.chomp
    if filter.length == 1
      break
    else puts "Enter just one letter"
    end
  end
  filter
end

def print_header
  puts "The Academy of Football"
  puts "----------------"
end

def print
  filter = student_filter
  count = @students.count
  if count < 1 || nil
    puts "There are no students entered"
    input_students
  end
  i = 0
  while i < count
    if @students[i][:name].start_with?(filter) || @students[i][:name].start_with?(filter.capitalize) && @students[i][:name].length <= 12
      puts "#{i+1}: Name: #{@students[i][:name].center(12)}\n   Cohort:" + @students[i][:cohort].to_s.center(12) + "\n   Hobbies: #{@students[i][:hobbies].center(8)} \n   Country: #{@students[i][:city].center(8)}"
      puts "--------------"
    end
    i+=1
  end
end
# line up the text. look at using \n

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
    save_students
  when "4"
    load_students
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
