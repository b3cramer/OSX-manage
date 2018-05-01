File.open("/private/var/log/system.log").each do |line|
  if line.include?("BUG")
    puts line
  end
end
