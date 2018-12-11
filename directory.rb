
def input_students
  puts "Enter the name of student"
  puts "To finish, hit return twice"
  students = []
  name = gets.chomp
    while !name.empty? do
      puts "Enter hobbies:"
      hobbies = gets.chomp
      puts "Enter place of birth:"
      city = gets.chomp
      students << {name: name, cohort: :January, hobbies: hobbies, country: city}
      puts "Now we have #{students.count} students"
      name = gets.chomp
    end
  students
  # Find a way to keep asking for hobbies as well as name. At the moment, hobbies only works for one.
  # Tempted to put the input in a separate method and pass it all through.
end

def student_filter
  while true
    puts "Enter a letter:"
    filter = gets.chomp
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

def print(students)
  filter = student_filter
  count = students.count
  i = 0
  while i < count
    if students[i][:name].start_with?(filter) && students[i][:name].length <= 12
      puts "#{i+1}: Name: #{students[i][:name]} - Cohort: #{students[i][:cohort]} - Hobbies: #{students[i][:hobbies]} - Country: #{students[i][:city]}"
    end
    i+=1
  end
end


def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
