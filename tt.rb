# encoding: utf-8
#"Found 1 devices\nDevice #0: 21.1\xC2\xB0C 70.0\xC2\xB0F\n"
ENV['LC_CTYPE']='en_US.UTF-8' 
require "net/http"
require "uri"

loop do
output = `sudo temper-poll`

temp = output.split("C ")[1].split("°F")[0]
p "Found temperature: #{temp}"

p "Submitting to web monitor"

uri = URI.parse("http://yurtemp.herokuapp.com/temperatures")

response = Net::HTTP.post_form(uri, {"temperature[degrees]" => "#{temp}"})

p response
sleep 600
end

