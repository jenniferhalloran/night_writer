require './lib/translator'

class NightWriter
  attr_accessor :read_file,
              :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @translator = Translator.new
  end

  def read_and_write_to_file(read_file_name = @read_file, write_file_name = @write_file)
    english_string = File.read(read_file_name)
    braille_message = @translator.english_to_braille(english_string)
    File.write(write_file_name, braille_message)
    puts "Created '#{write_file_name}' containing #{english_string.size} characters"
  end

end

night_writer = NightWriter.new

night_writer.read_file = './message.txt' if night_writer.read_file == "spec/night_writer_spec.rb" || night_writer.read_file.nil?
##create a file and write a default message
night_writer.write_file = './braille.txt' if night_writer.write_file.nil?

night_writer.read_and_write_to_file


##dependencey injection
