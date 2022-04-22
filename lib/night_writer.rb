require './lib/dictionary'

class NightWriter
  attr_reader :existing_file,
              :new_file

  def initialize()
    @existing_file = "message.txt"
    # @existing_file = ARGV[0]
    @new_file = "braille.txt"
    # @new_file = ARGV[1]
    ##may be good to have other default files if something is not entered.
    @dictionary = Dictionary.new
  end

  def read_message
    File.open(@existing_file).read.chomp
  end

  def breakdown_message
    read_message.chars.map { |letter| converter(letter.downcase) }
  end

  def converter(letter)
    braille_letter = @dictionary.translations[letter]
    braille_letter
  end

  def write_message_to_file
    message = breakdown_message
    File.open(@new_file, "w") do |file|
      file.write(message)
    end
    ##need to close files?
    puts "Created '#{@new_file}' containing #{read_message.size} characters"
  end

end

NightWriter.new.write_message_to_file


## read message
## break it down into characters
## check the dictionary for each english character and set that english character equal to the 3 corresponding braille arrays in the dictionary
## shovel braille_letter[0] into top, braille_letter[1] into middle, braille_letter[2] into bottom of braille BrailleGenerator
##format braille generator print out
##### flatten/join
