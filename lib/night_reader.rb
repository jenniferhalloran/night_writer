require './lib/translator'

class NightReader
  attr_accessor :read_file,
              :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @translator = Translator.new
  end

  def read_and_write_to_file(read_file_name = @read_file, write_file_name = @write_file)
    braille_string = File.read(read_file_name)
    english_message = @translator.braille_to_english(braille_string)
    File.write(write_file_name, english_message)
    puts "Created '#{write_file_name}' containing #{braille_string.size} characters"
  end

end

night_reader = NightReader.new

night_reader.read_file = './braille.txt' if night_reader.read_file == "spec/night_reader_spec.rb" || night_reader.read_file.nil?
night_reader.write_file = './original_message.txt' if night_reader.write_file.nil?

night_reader.read_and_write_to_file
