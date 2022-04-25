class Translator
  attr_reader :braille_equivalent

  def initialize
    @braille_equivalent = {
      "a" => ["O.", "..", ".."],
      "b" => ["O.", "O.", ".."],
      "c" => ["OO", "..", ".."],
      "d" => ["OO", ".O", ".."],
      "e" => ["O.", ".O", ".."],
      "f" => ['OO', 'O.', '..'],
      "g" => ["OO", "OO", ".."],
      "h" => ["O.", "OO", ".."],
      "i" => [".O", "O.", ".."],
      "j" => [".O", "OO", ".."],
      "k" => ["O.", "..", "O."],
      "l" => ["O.", "O.", "O."],
      "m" => ["OO", "..", "O."],
      "n" => ["OO", ".O", "O."],
      "o" => ["O.", ".O", "O."],
      "p" => ["OO", "O.", "O."],
      "q" => ["OO", "OO", "O."],
      "r" => ["O.", "OO", "O."],
      "s" => [".O", "O.", "O."],
      "t" => [".O", "OO", "O."],
      "u" => ["O.", "..", "OO"],
      "v" => ["O.", "O.", "OO"],
      "w" => [".O", "OO", ".O"],
      "x" => ["OO", "..", "OO"],
      "y" => ["OO", ".O", "OO"],
      "z" => ["O.", ".O", "OO"],
      " " => ["..", "..", ".."]
    }
    @english_equivalent = @braille_equivalent.invert
    @braille_message = []
  end

  def english_to_braille(english_string)
    braille_letters = translate_string_breakdown(english_string)
    format_braille_letters(braille_letters)
  end

  def translate_string_breakdown(english_string)
    message_characters = breakdown_message(english_string)
    message_characters.map { |english_letter| translate_to_braille(english_letter) }
  end

  def breakdown_message(english_string)
    english_string.chomp.chars
  end

  def translate_to_braille(english_letter)
    @braille_equivalent[english_letter]
  end

  def format_braille_letters(braille_letters)
    braille_lines = braille_letters.transpose
    create_line_breaks(braille_lines)
    @braille_message.flatten.join
  end

  def create_line_breaks(braille_lines)
    index = 0
    (braille_lines[0].count.to_f / 40).ceil.times do
      braille_lines.each do |line|
        @braille_message << line[index..index + 39]
        @braille_message << "\n"
      end
      index += 40
    end
  end

## BRAILLE TO ENGLISH
def braille_to_english(braille_message)
  braille_letters = format_braille_for_translation(braille_message)
end

def format_braille_for_translation(braille_message)
  braille_arrays = braille_message.split("\n").map {|line| line.scan(/../)}.each_slice(3)
  braille_arrays.map{|array| array.transpose}
end

end
