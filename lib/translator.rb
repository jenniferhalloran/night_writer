class Translator
  attr_reader :letter_to_braille

  def initialize
    @letter_to_braille = {
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
  end

  def english_to_braille(english_string)
    unformatted_braille = translate_string_breakdown(english_string)
    format_braille_letters(unformatted_braille)
  end

  def translate_string_breakdown(english_string)
    breakdown_message(english_string).map do |english_letter|
      translate_english_letter(english_letter)
    end
  end

  def breakdown_message(english_string)
    english_string.chomp.chars
  end

  def translate_english_letter(english_letter)
    @letter_to_braille[english_letter]
  end

  def format_braille_letters(unformatted_braille)
    unformatted_braille.transpose.map { |braille_line| braille_line.join}.join("\n")
  end


end
