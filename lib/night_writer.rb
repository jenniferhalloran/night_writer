require './lib/translator'

class NightWriter
  attr_reader :read_file,
              :write_file

  def initialize()
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    ##may be good to have other default files if something is not entered.
    @translator = Translator.new
  end

  def read_and_write_to_file(read_file = @read_file, write_file = @write_file)
    english_string = File.read(read_file)
    braille_message = translator.english_to_braille(english_string)
    File.write(write_file, braille_message)
    puts "Created '#{@new_file}' containing #{braille_message.size} characters"
  end

end

NightWriter.new.read_and_write_to_file


## read message
## break it down into characters
## check the dictionary for each english character and set that english character equal to the 3 corresponding braille arrays in the dictionary
## shovel braille_letter[0] into top, braille_letter[1] into middle, braille_letter[2] into bottom of braille BrailleGenerator
##format braille generator print out
##### flatten/join
