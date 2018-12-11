
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
      students << {name: name, cohort: :January, hobbies: hobbies, city: city}
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
    if students[i][:name].start_with?(filter) || students[i][:name].start_with?(filter.capitalize) && students[i][:name].length <= 12
      puts "#{i+1}: Name: #{students[i][:name].center(12)}\n   Cohort:" + students[i][:cohort].to_s.center(12) + "\n   Hobbies: #{students[i][:hobbies].center(8)} \n   Country: #{students[i][:city].center(8)}"
      puts "--------------"
    end
    i+=1
  end
end
# line up the text. look at using \n

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
