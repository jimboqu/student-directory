# Woo hoo! This program reads its own source code

File.open($0, "r") do |file|
  file.each do |line|
    puts line
  end
end
