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

def print_header
  puts "The Academy"
  puts "----------------"
end
def print(students)
  students.each do |student|
    puts "Name: #{student[:name]} - (Cohort: #{student[:cohort]})"
  end
end

def print_footer(students)
 puts "Overall we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
