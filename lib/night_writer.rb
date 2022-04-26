require './lib/english_translator'
require './lib/read_and_write'

class NightWriter
  include ReadAndWrite

  attr_accessor :read_file,
              :write_file,
              :english_translator

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @english_translator = EnglishTranslator.new
  end
end

night_writer = NightWriter.new

night_writer.read_file = './message.txt' if night_writer.read_file == "spec/night_writer_spec.rb" || night_writer.read_file.nil?
night_writer.write_file = './braille.txt' if night_writer.write_file.nil?

night_writer.read_and_write_to_file(night_writer.read_file, night_writer.write_file, night_writer.english_translator)
