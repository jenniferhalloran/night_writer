require './lib/braille_translator'
require './lib/read_and_write'

class NightReader
  include ReadAndWrite

  attr_accessor :read_file,
              :write_file,
              :braille_translator

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @braille_translator = BrailleTranslator.new
  end
end

night_reader = NightReader.new

night_reader.read_file = './braille.txt' if night_reader.read_file == "spec/night_reader_spec.rb" || night_reader.read_file.nil?
night_reader.write_file = './original_message.txt' if night_reader.write_file.nil?

night_reader.read_and_write_to_file(night_reader.read_file, night_reader.write_file, night_reader.braille_translator, night_reader.write_file)
