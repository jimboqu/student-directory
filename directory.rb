

students = [
  {name: "Bob Smith", cohort: :January},
  {name: "John Brown",cohort: :January},
  {name: "Tracy Beaker",cohort: :January},
  {name: "Hutch",cohort: :January},
  {name: "Starskey",cohort: :January},
  {name: "Donald Duck",cohort: :January},
  {name: "Billy Bonds",cohort: :January},
  {name: "Trevor Brooking", cohort: :January},
  {name: "Pat Holland",cohort: :January},
  {name: "John Lyall",cohort: :January},
  {name: "Alvin Martin",cohort: :January}
]


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

print_header
print(students)
print_footer(students)
