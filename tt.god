God.watch do |w|
  w.name = "tt"
  w.start = "ruby /home/pi/dev/tt/tt.rb"
  w.log = "/var/log/tt.log"
  w.keepalive
end
