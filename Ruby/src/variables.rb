f = File.new("generated_emails.csv",  "w+")
f.truncate 0

f.puts "email,inbox,\n"
(1..300).each do |i|
  f.puts "workforce#{i}@e.rainforestqa.com,https://e.rainforestqa.com/workforce#{i},\n"
end
