class Timer
    def self.run_timer(seconds)
      seconds.downto(0) do |second|
        print "Temps restant : #{second} secondes"
        sleep(1)
        print "\r"
      end
      puts "\n"
    end
  end