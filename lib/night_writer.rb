require './lib/dictionary'

class NightWriter
  attr_reader :existing_file,
              :new_file

  def initialize()
    @existing_file = "message.txt"#ARGV[0]
    @new_file = "braille.txt" #ARGV[1]
    ##may be good to have other default files if something is not entered.
    @dictionary = Dictionary.new
  end

  def read_message
    File.open(@existing_file).read
  end

  def transform_message
    read_message.chars.map { |letter| converter(letter.downcase) }.join("")
  end

  def converter(letter)
    letter = @dictionary.letters[letter]
    letter
  end

  def write_message_to_file
    message = transform_message
    File.open(@new_file, "w") do |file|
      file.write(message)
    end
    puts "Created '#{@new_file}' containing #{message.size} characters"
    ##need to divide message size by 6??
  end

end

NightWriter.new.write_message_to_file
