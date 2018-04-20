#puts "Hola gente"; puts 'This is the second line'

#puts 4

#puts 4.39

#puts 4 + 3.98

# =beging
# print "Hello
# second line"
# print " "
# print "gente"
# =end

# Multi line ca be done by multiple selecting and pressing
# CMD key + forward slash

#puts
#puts "Steven Sellig"

#p "Steven Sellig"

#puts "This is a
#big line break"

#p "This is a
#big line break"

#p 1 + 3

#p 6 - 14

#p 4 * 3

#p "School" + "bus"

#p 12 / 5.0

# # Power exponential
# p 3 ** 3
#
# # Modulus
# p 5 % 2
#
# p 19 % 3

# Variables
# val1 = 13
# p val1

a, b, c = 12 , 3 , 9

p a
p b
p c

10.downto(1) { |i| puts "Countdown: #{i}" }



message = <<-MSG
Random Line 1
Random Line 2
From: person@example.com
Date: 01-01-2011
To: friend@example.com
Subject: This is the subject line
Random Line 3
Random Line 4
MSG

message.each_line do |line|
  unless line.scan(/Sub.*/).empty?
    puts line
  end
end
