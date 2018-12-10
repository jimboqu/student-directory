
student_count = 11
students = [
  "Bob Smith",
  "John Brown",
  "Tracy Beaker",
  "Hutch",
  "Starskey",
  "Donald Duck",
  "Billy Bonds",
  "Trevor Brooking",
  "Pat Holland",
  "John Lyall",
  "Alvin Martin"
]

def print_header
  puts "The Academy"
  puts "----------------"
end
def print(students)
  students.each do |student|
    puts student
  end
end
def print_footer(students)
 puts "Overall we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)
