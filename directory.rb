
def pluralize(number)
  if number == 1
    return "student"
  else
    return "students"
  end
end

def remove_gets_return(string)
  return string.rstrip
end

def order_students(students)
  students.sort_by! { |hsh| hsh[:cohort] }
  students
end

def add_cohort
  puts "Add cohort month (January, April, July, October):"
  while true
    cohort = gets.capitalize
    cohort = remove_gets_return(cohort)
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
  students = []
  name = gets
  name = remove_gets_return(name)
    while !name.empty? do
      cohort = add_cohort
      puts "Enter hobbies:"
      hobbies = gets
      hobbies = remove_gets_return(hobbies)
      puts "Enter place of birth:"
      city = gets
      city = remove_gets_return(city)
      students << {name: name, cohort: cohort, hobbies: hobbies, city: city}
      puts "Now we have #{students.count} #{pluralize(students.count)}."
      name = gets.chomp
    end
  students = order_students(students)
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
  count = students.count
  if count < 1 || nil
    puts "There are no students entered"
    input_students
  end
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
  puts "Overall we have #{students.count} great #{pluralize(students.count)}."
end
students = input_students
print_header
print(students)
print_footer(students)
