def input_students
  puts "Enter the name of student"
  puts "To finish, hit return twice"
  students = []
  name = gets.chomp
    while !name.empty? do
      students << {name: name, cohort: :January}
      puts "Now we have #{students.count} students"
      name = gets.chomp
  end
  students
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
  students.each_with_index do |student, index|
    if student[:name].start_with?(filter) && student[:name].length <= 12
      puts "#{index + 1}: Name: #{student[:name]} - (Cohort: #{student[:cohort]})"
    end
  end
end

def print_footer(students)
 puts "Overall we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
