class NightWriter
  attr_reader :existing_file,
              :new_file

  def initialize()
    @existing_file = "message.txt"#ARGV[0]
    @new_file = "braille.txt" #ARGV[1]
    ##may be good to have other default files if something is not entered.
  end


  # # this program takes the filepath with a message, opens the desired file path reads the message
  # # and prints the messsage in that file to the terminal.
  # def print_message
  #   message = File.open(@existing_file).read
  #   puts message
  # end
  # # it works! now break it up to read the file, then print it new a new file(the second argument passed in on the terminal)
  ## Read the file

  def read_message
    File.open(@existing_file).read
  end

  def write_message_to_file
    message = read_message
    # require "pry"; binding.pry
    File.open(@new_file, "w") do |file|
      file.write(message)
    end
    puts "Created '#{@new_file}' containing #{message.size} characters"
  end
end

NightWriter.new.write_message_to_file
